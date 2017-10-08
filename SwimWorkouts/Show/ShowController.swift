//
//  showController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 10/1/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import UIKit

class ShowController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var segmentTable: UITableView!
    
    var workout: Workout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentTable.delegate = self
        segmentTable.dataSource = self
        
        titleLabel.text = workout.description
        descriptionLabel.text = workout.note
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return workout.segments.warmUp.count
        case 1:
            return workout.segments.mainSet.count
        case 2:
            return workout.segments.coolDown.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentCellIdentifier", for: indexPath) as? SegmentCell  else {
            fatalError("The dequeued cell is not an instance of SegmentCell.")
        }
        
        cell.segmentLabel.text = "\(getSegment(at: indexPath).description)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Warm Up"
        case 1:
            return "Main Set"
        case 2:
            return "Cool Down"
        default:
            return ""
        }
    }
    
    func getSegment(at indexPath: IndexPath) -> Segment {
        var section: [Segment]
        
        switch indexPath.section {
        case 0:
            section = workout.segments.warmUp
        case 1:
            section = workout.segments.mainSet
        case 2:
            section = workout.segments.coolDown
        default:
            section = workout.segments.mainSet
        }
        
        return section[indexPath.row]
    }
    
}
