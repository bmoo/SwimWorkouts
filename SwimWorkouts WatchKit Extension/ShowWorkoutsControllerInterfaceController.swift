//
//  ShowWorkoutsControllerInterfaceController.swift
//  SwimWorkouts WatchKit Extension
//
//  Created by Brad Moore on 9/3/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import WatchKit
import Foundation

class ShowWorkoutsController: WKInterfaceController {

    var workouts: [Workout] = []
    let workoutRepository = WorkoutRepository()

    override init() {
        super.init()
        
        workoutRepository.initWorkouts()
    }

    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return workoutRepository.getWorkouts()
    }

}
