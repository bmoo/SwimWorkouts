//
//  Repository.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 10/15/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import CloudKit

protocol SWCloudDatabase {
    func perform(_ query: CKQuery, inZoneWith zoneID: CKRecordZone.ID?, completionHandler: @escaping ([CKRecord]?, Error?) -> Swift.Void)
}

extension CKDatabase: SWCloudDatabase {}

class ListRepository {
    var workouts: [Workout]
    
    let cloudKitContainerId = "iCloud.bradmoore.org.SwimWorkouts"
    
    init() throws {
        self.workouts = [Workout]()
        let container = CKContainer(identifier: cloudKitContainerId)
        self.workouts = try loadRecords(database: container.privateCloudDatabase)
    }
    
    func readRecords(_ error: Error?, _ possibleRecordList: [CKRecord]?) throws -> [Workout] {
        var results = [Workout]()
        
        if let theError = error {
            throw theError
        }
        
        if let records = possibleRecordList {
            for r in records {
                let description = r.value(forKeyPath: "description") as! String
                let note = r.value(forKeyPath: "note") as! String
                
                results.append(Workout(description: description, segments: SegmentSet(warmUp: [Segment](), mainSet: [Segment](), coolDown: [Segment]()), note: note))
            }
        }
        
        return results
    }
    
    func loadRecords(database: SWCloudDatabase) throws -> [Workout] {
        var results = [Workout]()
        let query = CKQuery(recordType: "Workout", predicate: NSPredicate(value: true))
       
        var nestedError: Error?
        
        database.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (possibleRecordList, error) in
            do {
                results = try self.readRecords(error, possibleRecordList)
            } catch {
                nestedError = error
            }
        }
       
        if let error = nestedError {
            throw error
        }

        return results
    }

}
