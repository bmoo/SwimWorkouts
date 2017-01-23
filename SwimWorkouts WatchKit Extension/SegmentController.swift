//
//  SegueController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import WatchKit

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
    
    override func awake(withContext context: Any?) {
        workout = context as! Workout
        self.setTitle(workout.description)
        
        notesLabel.setText("\(workout.note)")
        
        var segmentNumber: Int = 1
        
        warmUpTable.setNumberOfRows(workout.segments.warmUp.count, withRowType: "warmUpRowController")
        
        for (index, value) in workout.segments.warmUp.enumerated() {
            let row = warmUpTable.rowController(at: index) as! WarmUpRowController
            row.segmentLabel.setText("\(segmentNumber): \(value.description)")
            segmentNumber += 1
        }
        
        mainSetTable.setNumberOfRows(workout.segments.mainSet.count, withRowType: "mainSetRowController")
        
        for (index, value) in workout.segments.mainSet.enumerated() {
            let row = mainSetTable.rowController(at: index) as!
            MainSetRowController
            row.segmentLabel.setText("\(segmentNumber): \(value.description)")
            segmentNumber += 1
        }
        
        coolDownTable.setNumberOfRows(workout.segments.coolDown.count, withRowType: "coolDownRowController")
        
        for (index, value) in workout.segments.coolDown.enumerated() {
            let row = coolDownTable.rowController(at: index) as!
            CoolDownRowController
            row.segmentLabel.setText("\(segmentNumber): \(value.description)")
            segmentNumber += 1
        }
    }
    
    
}
