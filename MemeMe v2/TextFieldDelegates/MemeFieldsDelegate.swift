//
//  MemeFieldsDelegate.swift
//  MemeMe v1
//
//  Created by iBot on 5/29/19.
//  Copyright © 2019 iBot. All rights reserved.
//

import Foundation
import UIKit

class MemeFieldsDelegate : NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM"{
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
