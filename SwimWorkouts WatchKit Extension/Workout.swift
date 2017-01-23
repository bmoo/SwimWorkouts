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
    var distance: Int
    var rest: Int
    var snorkel: Bool
    var reps: Int
}

func DefaultWorkout() -> Workout {
    let firstSegment = Segment(description: "alt FB, SGND, swlm (focus: the tube)", distance: 25, rest: 10, snorkel: true, reps: 6)
    let secondSegment = Segment(description: "alt FB, BB (focus: tight line)", distance: 25, rest: 15, snorkel: false, reps: 3)
    let thirdSegment = Segment(description: "SGNU alt weak, good, weak", distance: 25, rest: 20, snorkel: false, reps: 2)
    
    
    return Workout(description: "1. Static Balance", segments: [firstSegment, secondSegment, thirdSegment], note: "This entire practice is done at warm-up and cool-down intesity")
}

func FifthWorkout() -> Workout {
    let firstSegment = Segment(description: "1. alt Side Glide with breathing 25 rt25 lft, Side Glide Single Stroke 25", distance: 25, rest: 10, snorkel: false, reps: 6)
    let secondSegment = Segment(description: "2. alt 25 Side Glide Single Stroke, 25 swim (focus: side skating)", distance: 25, rest: 10, snorkel: true, reps: 4)
    let thirdSegment = Segment(description: "3. alt 25 SGND, 25 SGSS (focus: patches and cheeks)", distance: 50, rest: 15, snorkel: true, reps: 2)
    let fourthSegment = Segment(description: "4. alt 25 SG Single Stroke, 25 3 Strokes and Glide (focus: patches and cheeks)", distance: 50, rest: 15, snorkel: true, reps: 2)
    let fifthSegment = Segment(description: "5. alt 25 SG Single Stroke, 25 3 Stoke and Glide", distance: 25, rest: 10, snorkel: true, reps: 4)
    let sixthSegment = Segment(description: "6. Swim", distance: 25, rest: 10, snorkel: false, reps: 2)
    let seventhSegment = Segment(description: "7. Long Axis Rotation tight-schlumpy-tight", distance: 25, rest: 10, snorkel: true, reps: 2)
    let eigthSegment = Segment(description: "8. alt 25 SGND, 25 SGSS, 25 swim (focus: downhill swimming)", distance: 25, rest: 10, snorkel: true, reps: 6)
    
    return Workout(description: "5. More Stroke Integration", segments: [firstSegment, secondSegment, thirdSegment, fourthSegment, fifthSegment, sixthSegment, seventhSegment, eigthSegment], note: "Total distance: 900. Take more rest than indicated if out of breath")
    
}
