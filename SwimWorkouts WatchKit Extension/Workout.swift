//
//  Workout.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation

struct Workout {
    var description: String
    var segments: [Segment]
}

struct Segment {
    var description: String
    var reps: Int
}

func DefaultWorkout() -> Workout {
    let firstSegment = Segment(description: "Side Glide Nose Down", reps: 4)
    let secondSegment = Segment(description: "Side Glide Nose Up", reps: 2)
    
    return Workout(description: "A beginner workout", segments: [firstSegment, secondSegment])
}

func SecondWorkout() -> Workout {
    let firstSegment = Segment(description: "Side Glide Nose Down", reps: 4)
    let secondSegment = Segment(description: "Side Glide Nose Up", reps: 2)
    
    return Workout(description: "An intermediate workout", segments: [firstSegment, secondSegment])
}
