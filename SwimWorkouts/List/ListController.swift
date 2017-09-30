//
//  ListController.swift
//  SwimWorkouts
//
//  Created by Brad Moore on 9/30/17.
//  Copyright © 2017 Brad Moore. All rights reserved.
//

import Foundation
import UIKit

class ListController : UITableViewController {
    var workoutList: [Workout] = []
    
    override func viewDidLoad() {
        let repository = WorkoutRepository()
        self.workoutList = repository.getAll()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellIdentifier", for: indexPath) as? ListCell  else {
            fatalError("The dequeued cell is not an instance of ListCell.")
        }
        
        cell.nameLabel.text = workoutList[indexPath.row].description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    
    
}
