//
//  WorkoutRepository.swift
//  SwimWorkouts WatchKit Extension
//
//  Created by Brad Moore on 9/24/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import CloudKit

extension String: Error {}

class WorkoutRepository {
    
    var workouts: [Workout] = [Workout]()
    
    func initWorkouts() {
        let container = CKContainer(identifier: "iCloud.bradmoore.org.SwimWorkouts")
        let privateDb = container.privateCloudDatabase
        
        var results = [Workout]()
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Workout", predicate: predicate)
        
        privateDb.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (record, error) in
            if let theError = error {
                NSLog("Error is: \(theError)")
                return
            }
            
            for record: CKRecord in record! {
                let description = record.value(forKeyPath: "description") as! String
                let note = record.value(forKeyPath: "note") as! String
                
                results.append(Workout(description: description, segments: SegmentSet(warmUp: [Segment](), mainSet: [Segment](), coolDown: [Segment]()), note: note))
            }
            
            self.workouts = results
        }
    }
    
    func getWorkouts() -> [Workout] {
        return self.workouts
    }
}
