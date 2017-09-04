//
//  DataTests.swift
//  SwimWorkoutsTests
//
//  Created by Brad Moore on 9/2/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import XCTest
@testable import SwimWorkouts

class DataTests: XCTestCase {
    // sorta testing the framework, but I'm still learning
    func testCreateUserInfoFromWorkout() {
        let expected = Workout(description: "foo", segments: SegmentSet(warmUp: [Segment(description: "description", distance: 25, rest: 10, snorkel: true, reps: 6)], mainSet: [], coolDown: []), note: "bar")
        
        let userInfo = serializeWorkout(expected)
        
        XCTAssertEqual(userInfo["description"] as? String, expected.description)
        
        XCTAssertNotNil(userInfo["segments"])
        let segmentSet = userInfo["segments"] as! [String: Any]
        
        let warmUp = segmentSet["warmup"] as! [String: Any]
        XCTAssertNotNil(warmUp)
        
        let firstWarmUp = warmUp["0"] as! [String: Any]
        
        XCTAssertEqual(firstWarmUp["description"] as! String, "description")
        
        

        let mainSet = segmentSet["mainset"] as! [String: Any]
        XCTAssertNotNil(mainSet)
        
        let coolDown = segmentSet["cooldown"] as! [String: Any]
        XCTAssertNotNil(coolDown)
        
        

        XCTAssertEqual(userInfo["note"] as? String, expected.note)
    }
    
}
