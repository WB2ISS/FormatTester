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
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var groupingLabel: UILabel!
    @IBOutlet weak var decimalCommaLabel: UILabel!
    
    @IBOutlet weak var textInputModeLabel: UILabel!
    
    var acceptDecimalComma: Bool {
        if let decimalSeparator = Locale.current.decimalSeparator {
            if decimalSeparator == "," { return true }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        formatter = NumberFormatter()
        formatter?.minimumIntegerDigits = 1
        formatter?.minimumFractionDigits = 3
        formatter?.maximumFractionDigits = 6

        regionLabel.text = Locale.autoupdatingCurrent.regionCode
        languageLabel.text = Locale.autoupdatingCurrent.languageCode
        decimalLabel.text = Locale.autoupdatingCurrent.decimalSeparator
        groupingLabel.text = Locale.autoupdatingCurrent.groupingSeparator
        
        textInputModeLabel.text = frequencyInputField.textInputMode?.primaryLanguage?.description
        
        decimalCommaLabel.text = "\(acceptDecimalComma)"
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector((changeInputMode(_ :))),
                                               name: NSNotification.Name.UITextInputCurrentInputModeDidChange, object: nil)
        
    }
    
@objc func changeInputMode(_ notification : NSNotification)
    {
        let primaryLanguage = frequencyInputField.textInputMode?.primaryLanguage?.description
        print("primaryLanguage: \(String(describing: primaryLanguage))")
    }
    
    
    @IBAction func choosePrimaryLanguage(_ sender: UIButton) {
        print("\(String(describing: sender.currentTitle))")
        frequencyInputField.textInputMode?.textInputModePrimaryLanguage = sender.currentTitle
        textInputModeLabel.text = frequencyInputField.textInputMode?.primaryLanguage?.description
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

