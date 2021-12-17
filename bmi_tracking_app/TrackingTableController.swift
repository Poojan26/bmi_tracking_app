//
//  TrackingTableController.swift
//  bmi_tracking_app
//
//  Created by Poojan on 12/16/21.
//

import UIKit

class TrackingTableController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    
  
    var details = [Details]()
    //var details = [
  //        Details(weight:"25",bmi:"19",date: "12/11/98",height: "23")]

    override func viewDidLoad() {
        super.viewDidLoad()
        

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


