//
//  StringExtensions.swift
//  MyX
//
//  Created by Musa Fedakar on 12/05/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return  NSLocalizedString(self, comment: "").localizedLowercase
    }
    func trim() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    
    
    struct NumberFormatter {
        static let instance = Foundation.NumberFormatter()
    }
    
    var doubleValue:Double? {
        return NumberFormatter.instance.number(from: self)?.doubleValue
    }
    
    var integerValue:Int? {
        return NumberFormatter.instance.number(from: self)?.intValue
    }
    
    var longValue: CLong? {
        return NumberFormatter.instance.number(from: self)?.intValue
    }
    
    
    func getFileNameFromFileNameString() -> String {
        
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent {
            return fileNameWithoutExtension
        } else {
            return ""
        }
    }
    
    func getFileExtensionFromFileNameString() -> String {
        
        if let fileExtension = NSURL(fileURLWithPath: self).pathExtension {
            return fileExtension
        } else {
            return ""
        }
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
 
    /// This method makes it easier extract a substring by character index where a character is viewed as a human-readable character (grapheme cluster).
    func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
    
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}


