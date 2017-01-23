//
//  SegmentDetailController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 1/22/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import WatchKit

class SegmentDetailController: WKInterfaceController {
    var segment: Segment!
    
    @IBOutlet var detailLabel: WKInterfaceLabel!
    
    @IBOutlet var restLabel: WKInterfaceLabel!
    
    @IBOutlet var repsLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        segment = context as! Segment
        
        self.setTitle(segment.description)
        self.detailLabel.setText(segment.description)
        self.restLabel.setText("\(segment.rest)")
        self.repsLabel.setText("\(segment.reps)")
    }
}
