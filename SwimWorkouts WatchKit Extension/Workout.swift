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

func createWorkoutFromDictionary(_ dictionary: [String: Any]) -> Workout {
    let description: String = dictionary["description"] as? String ?? ""
    let note = dictionary["note"] as? String ?? ""
    let segmentSet = deserializeSegmentSetFromDictionary(dictionary["segments"] as? [String: Any] ?? [String: Any]())
    
    return Workout(description: description, segments: segmentSet, note: note)
}

fileprivate func deserializeSegmentSetFromDictionary(_ dictionary: [String: Any]) -> SegmentSet {
    let warmUp = deserializeSegmentListFromDictionary(dictionary["warmup"] as? [String: Any])
    let mainSet = deserializeSegmentListFromDictionary(dictionary["mainset"] as? [String: Any])
    let coolDown = deserializeSegmentListFromDictionary(dictionary["cooldown"] as? [String: Any])
    
    return SegmentSet(warmUp: warmUp, mainSet: mainSet, coolDown: coolDown)
}

fileprivate func deserializeSegmentListFromDictionary(_ dictionary: [String: Any]?) -> [Segment] {
    if dictionary == nil {
        return [Segment]()
    }
    
    var result = [Segment]()
    
    var segmentCount = 0
    while let segment = dictionary!["\(segmentCount)"] as? [String: Any] {
        result.append(deserializeSegmentFromDictionary(segment))
        segmentCount += 1
    }
    
    return result
}

fileprivate func deserializeSegmentFromDictionary(_ dictionary: [String: Any]) -> Segment {
    let description: String = dictionary["description"] as? String ?? ""
    let distance = dictionary["distance"] as? Int ?? 0
    let rest = dictionary["rest"] as? Int ?? 0
    let snorkel = dictionary["snorkel"] as? Bool ?? false
    let reps = dictionary["reps"] as? Int ?? 0
    
    return Segment(description: description, distance: distance, rest: rest, snorkel: snorkel, reps: reps)
}
