//
//  ViewController.swift
//  FormatTester
//
//  Created by Barry P. Medoff on 5/24/18.
//  Copyright © 2018 Barry P. Medoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var frequencyInputField: EnTextField!
    @IBOutlet weak var frequencyOutputField: UILabel!
    
    
    var inputValue:NSNumber?
    var formatter: NumberFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        formatter = NumberFormatter()
        formatter?.minimumIntegerDigits = 1
        formatter?.minimumFractionDigits = 3
        formatter?.maximumFractionDigits = 6

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveFrequency(_ sender: UIButton) {
        frequencyInputField.resignFirstResponder()
        
        if let inputString = frequencyInputField.text {
            inputValue = formatter?.number(from: inputString)
            if let numberToDisplay = inputValue {
                frequencyOutputField.text = formatter?.string(from: numberToDisplay)
            } else {
                frequencyOutputField.text = "null value"
            }
            
        } else {
            frequencyOutputField.text = "null value"
        }
    }
    
}

