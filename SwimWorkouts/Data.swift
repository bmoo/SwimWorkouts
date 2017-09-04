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

func serializeWorkout(_ workout: Workout) -> [String: Any] {
    var result = [String: Any]()
    
    result["description"] = workout.description
    result["note"] = workout.note
    result["segments"] = serializeSegmentSet(workout.segments)
    
    return result
}

fileprivate func serializeSegmentSet(_ segmentSet: SegmentSet) -> [String: Any] {
    var result = [String: Any]()
    
    result["warmup"] = serializeSegments(segmentSet.warmUp)
    result["mainset"] = serializeSegments(segmentSet.mainSet)
    result["cooldown"] = serializeSegments(segmentSet.coolDown)
    
    return result
}

fileprivate func serializeSegments(_ segments: [Segment]) -> [String: Any] {
    var result = [String: Any]()
    
    var segmentCount = 0
    for segment in segments {
        let serializedSegment = serializeSegment(segment)
        
        result["\(segmentCount)"] = serializedSegment
        segmentCount += 1
    }
    
    return result
}

fileprivate func serializeSegment(_ segment: Segment) -> [String: Any] {
    var result = [String: Any]()
    
    result["description"] = segment.description
    result["rest"] = segment.rest
    result["snorkel"] = segment.snorkel
    result["reps"] = segment.reps
    result["distance"] = segment.distance
    
    return result
}
