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
    
    @IBOutlet var segmentTable: WKInterfaceTable!
    
    @IBOutlet var notesLabel: WKInterfaceLabel!
    
    var workout: Workout!
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        
        return workout.segments[rowIndex]
    }
    
    override func awake(withContext context: Any?) {
        workout = context as! Workout
        self.setTitle(workout.description)
        
        notesLabel.setText("\(workout.note)")
        
        segmentTable.setNumberOfRows(workout.segments.count, withRowType: "segmentRowController")
        
        for (index, value) in workout.segments.enumerated() {
            let row = segmentTable.rowController(at: index) as! SegmentTableRowController
            row.segmentLabel.setText(value.description)
        }
    }
}
