//
//  InterfaceController.swift
//  SwimWorkouts WatchKit Extension
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var workouts: [Workout] = [DefaultWorkout(), FifthWorkout()]

    @IBOutlet var workoutTable: WKInterfaceTable!
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {

        return workouts[rowIndex]
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        NSLog("InterfaceController.awake()")
        
        workoutTable.setNumberOfRows(workouts.count, withRowType: "workoutRowController")
        
        for (index, value) in workouts.enumerated() {
            let row = workoutTable.rowController(at: index) as! WorkoutTableRowController
            row.workoutLabel.setText(value.description)
        }
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
