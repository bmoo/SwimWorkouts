//
//  WorkoutRepository.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 9/30/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation

class WorkoutRepository {
    var workouts: [Workout]
    
    init() {
        self.workouts = [Workout]()
        
        self.workouts.append(FifthWorkout())
        self.workouts.append(SixthWorkout())
    }
    
    func getAll() -> [Workout] {
        return self.workouts
    }
}
