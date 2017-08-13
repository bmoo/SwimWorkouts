//
//  SegmentTableRowController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import WatchKit

protocol SegmentLabeller {
    var segmentLabel: WKInterfaceLabel! {get set}
}

public class WarmUpRowController: NSObject, SegmentLabeller {
    @IBOutlet var segmentLabel: WKInterfaceLabel!
}

public class MainSetRowController: NSObject, SegmentLabeller {
    @IBOutlet var segmentLabel: WKInterfaceLabel!
}

public class CoolDownRowController: NSObject, SegmentLabeller {
    @IBOutlet var segmentLabel: WKInterfaceLabel!
}
