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
        let expected = Workout(description: "foo", segments: SegmentSet(warmUp: [], mainSet: [], coolDown: []), note: "bar")
        
        let userInfo = createUserInfoFromWorkout(workout: expected)
        
        XCTAssertEqual(userInfo["description"] as? String, expected.description)
        XCTAssertEqual(userInfo["note"] as? String, expected.note)
    }
    
}
