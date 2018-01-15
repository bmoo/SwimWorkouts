//
//  WorkoutRepository.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 9/30/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import CloudKit

class WorkoutRepository {
    
    var workouts: [Workout]
    let cloudKitContainerId = "iCloud.bradmoore.org.SwimWorkouts"

    init() {
        self.workouts = [Workout]()
    }
    
    func getAll(onCompletion completionFunc: @escaping (CKQueryCursor?, Error?) -> Void) {
        let container = CKContainer(identifier: cloudKitContainerId)
        loadRecords(database: container.privateCloudDatabase, onCompletion: completionFunc)
    }
    
    fileprivate func setupQueryOperation(_ queryOperation: CKQueryOperation, onCompletion completionFunc: @escaping (CKQueryCursor?, Error?) -> Void) {
        queryOperation.recordFetchedBlock = { record in
            let description = record.value(forKeyPath: "description") as! String
            let note = record.value(forKeyPath: "note") as? String ?? "No note provided"
            
            self.workouts.append(Workout(description: description, segments: SegmentSet(warmUp: [Segment](), mainSet: [Segment](), coolDown: [Segment]()), note: note))
        }
        
        queryOperation.queryCompletionBlock = completionFunc
    }
    
    fileprivate func loadRecords(database: CKDatabase, onCompletion completionFunc: @escaping (CKQueryCursor?, Error?) -> Void) {
        let query = CKQuery(recordType: "Workout", predicate: NSPredicate(value: true))
        let queryOperation = CKQueryOperation(query: query)
       
        setupQueryOperation(queryOperation, onCompletion: completionFunc)

        database.add(queryOperation)
    }
    
    func create(_ workout: Workout, onCompletion completionFunc: @escaping (CKRecord?, Error?) -> Void) {
        let container = CKContainer(identifier: cloudKitContainerId)
        
        let database = container.privateCloudDatabase
        
        let record = CKRecord(recordType: "Workout")
        record["description"] = workout.description as NSString
        
        NSLog("calling save")
        database.save(record, completionHandler: completionFunc)
    }
}
