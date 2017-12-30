//
//  WorkoutRepository.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 9/30/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

class WorkoutRepository {
    
    var workouts: [Workout]
    let cloudKitContainerId = "iCloud.bradmoore.org.SwimWorkouts"

    init() {
        self.workouts = [Workout]()
    }
    
    func getAll(controller: ListController) -> [Workout] {
        self.workouts = [Workout]()
        let container = CKContainer(identifier: cloudKitContainerId)
        
        loadRecords(database: container.publicCloudDatabase, controller: controller)
        
        return self.workouts
    }
    
    func loadRecords(database: CKDatabase, controller: ListController) {
        let query = CKQuery(recordType: "Workout", predicate: NSPredicate(value: true))
        
        let queryOperation = CKQueryOperation(query: query)
        
        queryOperation.recordFetchedBlock = { record in
            let description = record.value(forKeyPath: "description") as! String
            let note = record.value(forKeyPath: "note") as? String ?? "No note provided"
            
            self.workouts.append(Workout(description: description, segments: SegmentSet(warmUp: [Segment](), mainSet: [Segment](), coolDown: [Segment]()), note: note))
        }
        
        queryOperation.queryCompletionBlock = { (cursor, error) in
            if let foundError = error {
                NSLog(foundError.localizedDescription)
            }
            
            DispatchQueue.main.async {
                if error == nil {
                    controller.workoutList = self.workouts
                    controller.tableView.reloadData()
                }
            }
        }

        database.add(queryOperation)
    }
}
