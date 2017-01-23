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
    var segments: SegmentSet
    var note: String
}

struct SegmentSet {
    var warmUp: [Segment]
    var mainSet: [Segment]
    var coolDown: [Segment]
}

struct Segment {
    var description: String
    var distance: Int
    var rest: Int
    var snorkel: Bool
    var reps: Int
}

func FifthWorkout() -> Workout {
    let firstSegment = Segment(description: "alt Side Glide with breathing 25 rt 25 lft, Side Glide Single Stroke 25 (start head down and head up as you turn, then down, then turn again", distance: 25, rest: 10, snorkel: false, reps: 6)
    let secondSegment = Segment(description: "alt 25 Side Glide Single Stroke, 25 swim (focus: side skating)", distance: 25, rest: 10, snorkel: true, reps: 4)
    let thirdSegment = Segment(description: "alt 25 Side Glide Nose Down, 25 SG Single Stroke (focus: patches and cheeks)", distance: 50, rest: 15, snorkel: true, reps: 2)
    let fourthSegment = Segment(description: "alt 25 SG Single Stroke, 25 3 Strokes and Glide (focus: patches and cheeks)", distance: 50, rest: 15, snorkel: true, reps: 2)
    let fifthSegment = Segment(description: "alt 25 SG Single Stroke, 25 3 Stoke and Glide", distance: 25, rest: 10, snorkel: true, reps: 4)
    let sixthSegment = Segment(description: "Swim", distance: 25, rest: 10, snorkel: false, reps: 2)
    let seventhSegment = Segment(description: "Long Axis Rotation - 2 flutter kicks, 1 turn kick (6 total), L-R only, no center", distance: 25, rest: 10, snorkel: true, reps: 2)
    let eigthSegment = Segment(description: "alt 25 SG Nose Down, 25 SG Single Stroke, 25 swim (focus: downhill swimming)", distance: 25, rest: 10, snorkel: true, reps: 6)
    
    let segmentSet = SegmentSet(warmUp: [firstSegment, secondSegment], mainSet: [thirdSegment, fourthSegment, fifthSegment, sixthSegment], coolDown: [seventhSegment, eigthSegment])
    
    return Workout(description: "5. More Stroke Integration", segments: segmentSet, note: "Total distance: 900. Take more rest than indicated if out of breath")
}

func SixthWorkout() -> Workout {
    // warmup
    let firstSegment = Segment(description: "at 25 FB 25 SGND rt, 25 SGND lft, 25 swim (focus: neutral shoulder)", distance: 25, rest: 10, snorkel: true, reps: 4)
    let secondSegment = Segment(description: "alt 25 SGNU, 25 SGB rt, SGB lft, 25 SGSS (focus: over the keg)", distance: 25, rest: 10, snorkel: false, reps: 4)
    
    // main set
    let thirdSegment = Segment(description: "alt 25 SGSS 25 3S&G (focus: over the keg)", distance: 50, rest: 15, snorkel: false, reps: 2)
    let fourthSegment = Segment(description: "alt 25 LAR, 25 3S&G (focus: snappy hips)", distance: 25, rest: 10, snorkel: false, reps: 2)
    let fifthSegment = Segment(description: "alt 25 3S&G, 25 swim (focus: pierce down to extension)", distance: 50, rest: 15, snorkel: true, reps: 2)
    let sixthSegment = Segment(description: "alt 25 LAR (easy), 25 LAR (faster)", distance: 25, rest: 10, snorkel: true, reps: 4)
    let seventh = Segment(description: "swim (focus: wide tracking", distance: 25, rest: 10, snorkel: true, reps: 2)
    
    // cool down
    let eigth = Segment(description: "alt 25 SGSS, 25 SGB, 25 swim (focus: the glove)", distance: 25, rest: 10, snorkel: false, reps: 6)
    
    let segmentSet = SegmentSet(warmUp: [firstSegment, secondSegment], mainSet: [thirdSegment, fourthSegment, fifthSegment, sixthSegment, seventh], coolDown: [eigth])
    
    return Workout(description: "6. Stroke Integration and Core Rotation", segments: segmentSet, note: "Continues stoke-integration drills and adds more core rotation work")
}
