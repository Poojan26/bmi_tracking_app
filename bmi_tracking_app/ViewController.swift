//
//  ViewController.swift
//  bmi_tracking_app
//
//  Created by Poojan on 12/16/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var AgeText: UITextField!
    @IBOutlet weak var GenderText: UITextField!
    @IBOutlet weak var Weighttext: UITextField!
    @IBOutlet weak var HeightText: UITextField!
    
    // Buttons and segment outlet
    @IBOutlet weak var CalculateBMI: UIButton!
    @IBOutlet weak var Typepick: UISegmentedControl!
    @IBOutlet weak var ResetButton: UIButton!
    
    
    @IBOutlet weak var AnalysisLabel: UILabel!
    @IBOutlet weak var BMILabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Button actions
    @IBAction func OnClickCalculate(_ sender: UIButton) {
        var age  = AgeText.text
        var gender = GenderText.text
        var weight  = Float(Weighttext.text!) ?? 0
        var height = Float(HeightText.text!) ?? 0
        var type = Typepick.titleForSegment(at: Typepick.selectedSegmentIndex)
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
        
        // Conditions for analysis message
        
        if (bmi < 16){
            AnalysisLabel.text = "Severe Thinness"
        }
        else if (bmi >= 16 && bmi < 17 ){
            AnalysisLabel.text = "Moderate Thinness"
        }
        else if (bmi >= 17 && bmi < 18.5){
            AnalysisLabel.text = "Mild Thinness"
        }
        else if (bmi >= 18.5 && bmi < 25){
            AnalysisLabel.text = "Normal"
        }
        else if (bmi >= 25 && bmi < 30 ){
            AnalysisLabel.text = "Overweight"
        }
        else if (bmi >= 30 && bmi < 35){
            AnalysisLabel.text = "Obese class 1"
        }
        else if (bmi >= 35 && bmi < 40){
            AnalysisLabel.text = "Obese class 2"
        }
        else {
            AnalysisLabel.text = "Obese class 3"
        }
    }
    
    // Reset button
    @IBAction func ResetButton(_ sender: UIButton) {
        NameText.text = ""
        AgeText.text = ""
        GenderText.text = ""
        Weighttext.text = ""
        HeightText.text = ""
        BMILabel.text = ""
    }
    
    // Done Button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigate"{
            //var date = "12/16/21"
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let date = Date()
            let time = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: date)
           
            
            let databaseRef = Database.database().reference(fromURL:"https://bmi-tracking-app-default-rtdb.firebaseio.com/")
            var db_id = databaseRef.child("Profile").childByAutoId()
            db_id.setValue(["Name": NameText.text!,"Age":AgeText.text!,"Gender":GenderText.text!,"Weight":Weighttext.text!, "Bmi": BMILabel.text!, "Height": HeightText.text!,"date":dateString])
            
            var details = [Details(weight:Weighttext.text!,bmi: BMILabel.text!,date: dateString, height: HeightText.text!,id: db_id.key!)]
            let destination = segue.destination as! TrackingTableController
            destination.details = details
        }
    }
    
}

