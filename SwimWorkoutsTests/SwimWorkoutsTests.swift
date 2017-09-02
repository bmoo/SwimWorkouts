//
//  SwimWorkoutsTests.swift
//  SwimWorkoutsTests
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import XCTest
import WatchConnectivity
@testable import SwimWorkouts

class MockWCSession: WatchConnectingSession {
    func transferUserInfo(_ userInfo: [String : Any]) -> WCSessionUserInfoTransfer {
        sentContext = userInfo
        
        return WCSessionUserInfoTransfer.init()
    }
    
    var paired, watchAppInstalled, reachable: Bool
    var sentContext: [String : Any]? = nil

    init(paired: Bool, watchAppInstalled: Bool, reachable: Bool) {
        self.paired = paired
        self.watchAppInstalled = watchAppInstalled
        self.reachable = reachable
    }

    var isWatchAppInstalled: Bool {
        return watchAppInstalled
    }
    var isPaired: Bool {
        return paired
    }
    var isReachable: Bool {
        return reachable
    }
}

class SwimWorkoutsTests: XCTestCase {
    func testSendStartupData() {
        let session = MockWCSession(paired: true, watchAppInstalled: true, reachable: true)
        
        let delegate = AppDelegate()
        delegate.sendStartupData(session)
        
        XCTAssertNotNil(session.sentContext)
    }
    
    func testSendStartupData_dontDoAnythingIfTheresNoWatch() {
        let session = MockWCSession(paired: true, watchAppInstalled: true, reachable: false)
        
        let delegate = AppDelegate()
        delegate.sendStartupData(session)
        
        XCTAssertNil(session.sentContext)

    }
}

