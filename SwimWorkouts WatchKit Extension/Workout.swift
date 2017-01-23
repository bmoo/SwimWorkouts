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
    var note: String
}

struct Segment {
    var description: String
    var rest: Int
    var snorkel: Bool
    var reps: Int
}

func DefaultWorkout() -> Workout {
    let firstSegment = Segment(description: "alt FB, SGND, swlm (focus: the tube)", rest: 10, snorkel: true, reps: 6)
    let secondSegment = Segment(description: "alt FB, BB (focus: tight line)", rest: 15, snorkel: false, reps: 3)
    let thirdSegment = Segment(description: "SGNU alt weak, good, weak", rest: 20, snorkel: false, reps: 2)
    
    
    return Workout(description: "Static Balance", segments: [firstSegment, secondSegment, thirdSegment], note: "This entire practice is done at warm-up and cool-down intesity")
}

func SecondWorkout() -> Workout {
    let firstSegment = Segment(description: "alt FB, SGND, swlm (focus: the tube)", rest: 10, snorkel: true, reps: 6)
    let secondSegment = Segment(description: "alt FB, BB (focus: tight line)", rest: 15, snorkel: false, reps: 3)

    return Workout(description: "An intermediate workout", segments: [firstSegment, secondSegment], note: "")
}
