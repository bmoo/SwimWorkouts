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
    
    var workout: Workout!
    
    override func awake(withContext context: Any?) {
        workout = context as! Workout
        self.setTitle(workout.description)
        
        segmentTable.setNumberOfRows(workout.segments.count, withRowType: "segmentRowController")
        
        for (index, value) in workout.segments.enumerated() {
            let row = segmentTable.rowController(at: index) as! SegmentTableRowController
            row.segmentLabel.setText(value.description)
        }
    }
    
}
