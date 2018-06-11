//
//  WorkoutRepositoryTest.swift
//  SwimWorkoutsTests
//
//  Created by Brad Moore on 9/30/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import XCTest
@testable import SwimWorkouts

class WorkoutRepositoryTest: XCTestCase {
    
    var subject: WorkoutRepository!
    
    override func setUp() {
        super.setUp()
        
        subject = WorkoutRepository()
    }
}
