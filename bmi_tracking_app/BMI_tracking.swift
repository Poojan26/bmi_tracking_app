//
//  BMI_tracking.swift
//  bmi_tracking_app
//
//  Created by Jay on 12/16/21.
//

import UIKit

class BMI_tracking: UITableViewController{

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello"
        return cell
    }
    //override func viewDidLoad() {
      //  super.viewDidLoad()
        //TableView.delegate = self
        //TableView.dataSource = self
        
        // Do any additional setup after loading the view.
    //}
    

}


