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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if workoutList.count == 0 {
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorView.Style.gray)
            
            spinner.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            spinner.isHidden = false
            spinner.startAnimating()
            
            self.tableView.addSubview(spinner)
            self.tableView.bringSubviewToFront(spinner)
            
            let repository = WorkoutRepository()
            
            // a completion handler could run off of the main thread
            repository.getAll(onCompletion: { (cursor, error) in
                if let foundError = error {
                    NSLog(foundError.localizedDescription)
                }
                
                self.workoutList = repository.workouts
                
                DispatchQueue.main.async {
                    spinner.removeFromSuperview()
                }
                
                self.tableView.reloadData()
            })
        }
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
        
        cell.workout = workoutList[indexPath.row]
        cell.nameLabel.text = workoutList[indexPath.row].description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ShowController {
            let senderCell = sender as! ListCell
            destination.workout = senderCell.workout
        }
    }
    
    
}
