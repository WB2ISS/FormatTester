//
//  EnTextField.swift
//  FormatTester
//
//  Created by Barry P. Medoff on 5/24/18.
//  Copyright © 2018 Barry P. Medoff. All rights reserved.
//

import UIKit

class EnTextField: UITextField {
    
    var inputMode: EnTextInputMode? = EnTextInputMode()

    override var textInputMode: EnTextInputMode? {
        return inputMode
    }
    
    class EnTextInputMode: UITextInputMode {
        var textInputModePrimaryLanguage: String? = "en-US" {
            didSet {
                print("was \(String(describing: oldValue)), now \(String(describing: textInputModePrimaryLanguage))")
            }
        }
        override var primaryLanguage: String? {
            return textInputModePrimaryLanguage
        }
    }
}



