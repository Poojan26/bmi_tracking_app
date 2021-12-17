//
//  DetailsCellController.swift
//  bmi_tracking_app
//
//  Created by Jay on 12/16/21.
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
