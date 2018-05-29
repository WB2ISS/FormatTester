//
//  EnTextField.swift
//  FormatTester
//
//  Created by Barry P. Medoff on 5/24/18.
//  Copyright © 2018 Barry P. Medoff. All rights reserved.
//

import UIKit

class EnTextField: UITextField {

    override var textInputMode: EnTextInputMode? {
        return EnTextInputMode()
    }
    
    class EnTextInputMode: UITextInputMode {
        override var primaryLanguage: String? {
            return "fr-US"
        }
    }
}



