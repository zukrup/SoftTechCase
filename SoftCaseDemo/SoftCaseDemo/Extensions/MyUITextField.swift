//
//  MyTextField.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation
import UIKit

class MyUITextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class MyUILabeLField : UILabel {
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override func drawText(in rect: CGRect) {
        
        let insets: UIEdgeInsets = padding
        super.drawText(in: rect.inset(by: insets))
        
    }
    override var intrinsicContentSize : CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += padding.top + padding.bottom
        intrinsicSuperViewContentSize.width += padding.left + padding.right
        return intrinsicSuperViewContentSize
    }
}

extension UILabel {
    
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            
            attributedString.addAttribute(NSAttributedString.Key.kern,
                                          value: newValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            
            attributedText = attributedString
        }
        
        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}
