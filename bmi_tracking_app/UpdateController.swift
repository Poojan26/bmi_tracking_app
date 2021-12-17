//
//  UpdateController.swift
//  bmi_tracking_app

// Name: Poojan Patel
// Student ID- 301228811
// Course: MAPD 714
//  ViewController.swift
//  Creating a BMI calculator app with multiple screens
//  Created by Poojan on 12/17/21.
//

import UIKit
import FirebaseDatabase

class UpdateController: UIViewController {
    
    // Field outlets
    @IBOutlet weak var WeightLabel: UITextField!
    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var DateLabel: UIDatePicker!
    @IBOutlet weak var typePicker: UISegmentedControl!
    @IBOutlet weak var BMILabel: UITextField!
    @IBOutlet weak var IdLabel: UILabel!
    
    
    var details = [Details]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let selected_row = details[0]
        WeightLabel.text = selected_row.weight
        HeightLabel.text = selected_row.height
        IdLabel.text = selected_row.id
        
        // Converting string to date
        let dateFormatter = DateFormatter()
        DateLabel.isSelected = (dateFormatter.date(from: selected_row.date) != nil)
        
        
    }
    
    @IBAction func UpdateBMI(_ sender: UIButton) {
        
        // Storing label values in variables
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
    
    // Update record button function
    @IBAction func UpdateTracker(_ sender: UIButton) {
        
        // Calling method from Trackingtablecontroller to create a new record with updated values
        
    }
    
    // Segue for delete and update
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var id = IdLabel.text!
        // Check if update button is clicked
        if segue.identifier == "updated"{
            //var date = "12/16/21"
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let date = DateLabel.date
            let time = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: date)
            var details = [Details(weight:WeightLabel.text!,bmi: BMILabel.text!,date: dateString, height: HeightLabel.text!,id: IdLabel.text!)]
            
        
            // Updating database
            let databaseRef = Database.database().reference(fromURL:"https://bmi-tracking-app-default-rtdb.firebaseio.com/").child("Profile/"+id)
            databaseRef.updateChildValues(["Weight":WeightLabel.text!, "Bmi":BMILabel.text!, "date":dateString])
            
            // Add values to table
            let destination = segue.destination as! TrackingTableController
            destination.details.append(contentsOf: details)
        }
        
        // Check if delete button is clicked
        if segue.identifier == "deleted"{
            
            // Delete entry from database
            let databaseRef = Database.database().reference(fromURL:"https://bmi-tracking-app-default-rtdb.firebaseio.com/").child("Profile/"+id)
            databaseRef.removeValue()
            
        }
        
    }}
