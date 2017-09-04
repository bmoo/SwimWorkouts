//
//  ShowWorkoutsControllerInterfaceController.swift
//  SwimWorkouts WatchKit Extension
//
//  Created by Brad Moore on 9/3/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class ShowWorkoutsController: WKInterfaceController, WCSessionDelegate {

    var workouts: [Workout] = []

    override init() {
        super.init()
        
        let session = WCSession.default
        session.delegate = self
        session.activate()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }
    
    public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("sessionDidReceiveUserInfo()")
        self.workouts = [createWorkoutFromDictionary(userInfo)]
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return workouts
    }

}
