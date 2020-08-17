//
//  UITextFieldExtensions.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.03.2019.
//  Copyright © 2019 musa fedakar. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable var doneAccessory: Bool {
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 32))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: MyStrings.sharedInstance.DONE, style: .done, target: self, action: #selector(self.doneButtonAction))
        done.setTitleTextAttributes([NSAttributedString.Key.font: Scully.sharedInstance.APP_BOLD_FONT_LARGE!], for: .normal)
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
}
