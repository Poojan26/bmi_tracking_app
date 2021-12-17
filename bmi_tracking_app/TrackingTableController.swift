//
//  TrackingTableController.swift
//  bmi_tracking_app
//
//  Created by Poojan on 12/16/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class TrackingTableController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    
  
    @IBOutlet weak var TableView: UITableView!
    var details = [Details]()
    
    // Declaring handle to read the database data
    var databaseHandle:FirebaseDatabase.DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let databaseRef = Database.database().reference(fromURL:"https://bmi-tracking-app-default-rtdb.firebaseio.com/").child("Profile")
        databaseRef.observe(.value, with: {(snapshot) in
            
//            for Profile in snapshot.children.allObjects as![DataSnapshot]{
//                let object = Profile.value as? [String:Any]
//                let weight = Profile.value["Weight"]
//                let height = Profile.value["Height"]
//                let bmi = Profile.value["bmi"]
//                let date = Profile.value["date"]
//
//                let new_details = Details(weight: weight, bmi: bmi, date: date, height: height)
//                self.details.append(new_details)
//
//            }
            //self.details = snapshot.children.allObjects as! [Details]
            
        })
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailsCellController
        let w_cell = details[indexPath.row]
        cell.set_details(weight: w_cell.weight, bmi: w_cell.bmi, date: w_cell.date)
        return cell
    }
    
    //what happens when row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //animates a deselction of selected item then navigates to second page
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "details", sender: details[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var det = details
        let updateView = segue.destination as! UpdateController
        updateView.details = det
    }
} 


