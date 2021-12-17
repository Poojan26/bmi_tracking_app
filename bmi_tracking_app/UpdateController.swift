//
//  UpdateController.swift
//  bmi_tracking_app
//
//  Created by Jay on 12/17/21.
//

import UIKit

class UpdateController: UIViewController {
    
    @IBOutlet weak var WeightLabel: UITextField!
    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var DateLabel: UIDatePicker!
    @IBOutlet weak var typePicker: UISegmentedControl!
    @IBOutlet weak var BMILabel: UITextField!
    
    var details = [
        Details(weight:"25",bmi:"19",date: "12/11/98",height: "23"),
        Details(weight:"25",bmi:"19",date:"12/11/98",height: "32"),
        Details(weight:"25",bmi:"19",date:"12/11/98",height: "22")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let selected_row = details[0]
        WeightLabel.text = selected_row.weight
        HeightLabel.text = selected_row.height
        
        // Converting string to date
        let dateFormatter = DateFormatter()
        DateLabel.isSelected = (dateFormatter.date(from: selected_row.date) != nil)
        
        
    }
    
    @IBAction func UpdateBMI(_ sender: UIButton) {
        var weight  = Float(WeightLabel.text!) ?? 0
        var height = Float(HeightLabel.text!) ?? 0
        var type = typePicker.titleForSegment(at: typePicker.selectedSegmentIndex)
        var bmi :Float = 0.0
        
        
        // Performing BMI calculation based on the unit type selected
        if type == "Standard"{
            bmi = weight  / (height * height)
            
            BMILabel.text = String(bmi)
            
        }
        else{
            bmi = (weight * 703) / (height * height)
            BMILabel.text = String(bmi)
        }
    }
    
    @IBAction func UpdateTracker(_ sender: UIButton) {
        
        // Calling method from Trackingtablecontroller to create a new record with updated values
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updated"{
            //var date = "12/16/21"
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let date = DateLabel.date
            let time = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: date)
            var details = [Details(weight:WeightLabel.text!,bmi: BMILabel.text!,date: dateString, height: HeightLabel.text!)]
            
            let destination = segue.destination as! TrackingTableController
            destination.details.append(contentsOf: details)
        }
    }}