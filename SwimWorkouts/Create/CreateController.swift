//
//  CreateController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 10/15/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import UIKit

class CreateController: UIViewController {
    
    @IBOutlet weak var name: UITextField!

    @IBAction func createButtonPressed(_ sender: UIButton) {
        let workout = Workout(description: name.text!, segments: SegmentSet(warmUp: [Segment](), mainSet: [Segment](), coolDown: [Segment]()), note: "")
        
        let repo = WorkoutRepository()
        
        repo.create(workout, onCompletion: { (record, error) in
            NSLog("calling completion handler")
            if let foundError = error {
                NSLog(foundError.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
}
