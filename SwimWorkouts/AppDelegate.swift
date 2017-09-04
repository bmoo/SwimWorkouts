//
//  AppDelegate.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import UIKit
import WatchConnectivity

protocol WatchConnectingSession {
    var isPaired: Bool { get }
    var isWatchAppInstalled: Bool { get }
    var isReachable: Bool { get }
    
    func transferUserInfo(_ userInfo: [String : Any]) -> WCSessionUserInfoTransfer
}

extension WCSession: WatchConnectingSession {}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        return
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        return
    }
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
        return true
    }
    
    func sendStartupData(_ session: WatchConnectingSession) {
        if (session.isPaired && session.isWatchAppInstalled && session.isReachable) {
            let fifthWorkout = serializeWorkout(FifthWorkout())
            let userInfoTransfer = session.transferUserInfo(fifthWorkout)
            
            print(userInfoTransfer)
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if (WCSession.isSupported()) {
            let session = WCSession.default
            sendStartupData(session)
        }
    }
}

