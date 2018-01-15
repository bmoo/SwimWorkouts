//
//  InterfaceController.swift
//  SwimWorkouts WatchKit Extension
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import WatchKit
import Foundation


class WorkoutController: WKInterfaceController {
    var workouts: [Workout] = []
    
    @IBOutlet var workoutTable: WKInterfaceTable!
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return workouts[rowIndex]
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        workouts = context as! [Workout]
        
        print("InterfaceController.awake()")
      }
    
    override func willActivate() {
        super.willActivate()
     
        workoutTable.setNumberOfRows(workouts.count, withRowType: "workoutRowController")
        
        for (index, value) in workouts.enumerated() {
            let row = workoutTable.rowController(at: index) as! WorkoutTableRowController
            row.workoutLabel.setText(value.description)
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
