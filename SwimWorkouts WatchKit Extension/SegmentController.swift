//
//  SegueController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import WatchKit

class SegmentInitializer {
    
    var segmentNumber: Int
    let workout: Workout
    
    init(workout: Workout) {
        self.workout = workout
        segmentNumber = 1
    }
    
    func initializeTable(segments: [Segment], rowType: String, table: WKInterfaceTable) {
        table.setNumberOfRows(segments.count, withRowType: rowType)
        
        for (index, value) in segments.enumerated() {
            guard let row = table.rowController(at: index) as? SegmentLabeller else {
                continue
            }
            
            row.segmentLabel.setText("\(segmentNumber): \(value.description)")
            self.segmentNumber += 1
        }
    }
}

class SegmentController: WKInterfaceController {
    
    @IBOutlet var warmUpTable: WKInterfaceTable!
    @IBOutlet var mainSetTable: WKInterfaceTable!
    @IBOutlet var coolDownTable: WKInterfaceTable!
    
    @IBOutlet var notesLabel: WKInterfaceLabel!
    
    var workout: Workout!
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        
        switch table {
        case warmUpTable:
            return workout.segments.warmUp[rowIndex]
        case mainSetTable:
            return workout.segments.mainSet[rowIndex]
        case coolDownTable:
            return workout.segments.coolDown[rowIndex]
        default:
            NSLog("Got an unknown table. Crashing")
            return nil
        }
    }
    
    fileprivate func initializeSegments() {
        let segmentInitializer = SegmentInitializer(workout: workout)
        
        segmentInitializer.initializeTable(segments: workout.segments.warmUp, rowType: "warmUpRowController", table: warmUpTable)
        segmentInitializer.initializeTable(segments: workout.segments.mainSet, rowType: "mainSetRowController", table: mainSetTable)
        segmentInitializer.initializeTable(segments: workout.segments.coolDown, rowType: "coolDownRowController", table: coolDownTable)
    }
    
    override func awake(withContext context: Any?) {
        workout = context as? Workout
        
        self.setTitle(workout.description)
        notesLabel.setText("\(workout.note)")
        
        initializeSegments()
    }
}
