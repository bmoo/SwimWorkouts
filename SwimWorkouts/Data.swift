//
//  Data.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 9/1/17.
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
