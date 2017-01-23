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
    
    @IBOutlet var distanceLabel: WKInterfaceLabel!
    
    @IBOutlet var snorkelLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        segment = context as! Segment
        
        let snorkelText = parseSnorkelText(snorkelBool: segment.snorkel)
        
        self.setTitle(segment.description)
        self.detailLabel.setText(segment.description)
        self.restLabel.setText("\(segment.rest)")
        self.repsLabel.setText("\(segment.reps)")
        self.distanceLabel.setText("\(segment.distance)")
        self.snorkelLabel.setText("\(snorkelText)")
    }
    
    func parseSnorkelText(snorkelBool: Bool) -> String {
        if (snorkelBool) {
            return "Yes"
        } else {
            return "No"
        }
    }
}
