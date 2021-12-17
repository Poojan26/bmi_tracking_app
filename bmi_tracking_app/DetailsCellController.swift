//
//  DetailsCellController.swift
//  bmi_tracking_app
// Name: Poojan Patel
// Student ID- 301228811
// Course: MAPD 714
//  ViewController.swift
//  Creating a BMI calculator app with multiple screens
//  Created by Poojan on 12/16/21.
//

import UIKit

class DetailsCellController: UITableViewCell {

    @IBOutlet weak var WeightLabel: UILabel!
    
    @IBOutlet weak var BmiLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!

    func set_details(weight:String, bmi:String, date:String){
        WeightLabel.text = weight
        BmiLabel.text = bmi
        DateLabel.text = date
    }
    
}
