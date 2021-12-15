//
//  ViewController.swift
//  bmi_tracking_app
//
//  Created by Jay on 12/15/21.
//

import UIKit

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
    @IBOutlet weak var DoneButton: UIButton!
    
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
        var hello = ""
        
        
        
        if type == "Standard"{
            var bmi:Float = weight  / (height*height)
            BMILabel.text = String(bmi)
            
        }
        else{
            var bmi:Float = (weight * 703) / (height*height)
            BMILabel.text = String(bmi)
        }
        
        
        
    
    }

}

