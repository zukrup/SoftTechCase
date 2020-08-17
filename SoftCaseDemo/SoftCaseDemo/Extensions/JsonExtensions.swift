//
//  JsonExtensions.swift
//  MyX
//
//  Created by Musa Fedakar on 07/06/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation 

protocol JSONable {}

extension JSONable {
    
    func toDict() -> [String:AnyObject] {
        var dict = [String:AnyObject]()
        let otherSelf = Mirror(reflecting: self)
        for child in otherSelf.children {
            if let key = child.label {
                dict[key] = child.value as AnyObject
            }
        }
        return dict
    }
    
}

protocol Serializable {
    var properties:Array<String> { get }
    func valueForKey(key: String) -> AnyObject?
    func toDictionary() -> [String:AnyObject]
}

extension Serializable {
   
    func toDictionary() -> [String:AnyObject] {
        var dict:[String:AnyObject] = [:]
        
        for prop in self.properties {
            
            if let val = self.valueForKey(key: prop) as? String {
                dict[prop] = val as AnyObject
            } else if let val = self.valueForKey(key: prop) as? Int {
                dict[prop] = val as AnyObject
            } else if let val = self.valueForKey(key: prop) as? Double {
                dict[prop] = val as AnyObject
            }
            else if let val = self.valueForKey(key: prop) as? Date {
                dict[prop] = Scully.sharedInstance.DateToIsoString(val) as AnyObject
            } else if let val = self.valueForKey(key: prop) as? Array<String> {
                dict[prop] = val as AnyObject
            } else if let val = self.valueForKey(key: prop) as? Serializable {
                dict[prop] = val.toDictionary() as AnyObject
            } else if let val = self.valueForKey(key: prop) as? Array<Serializable> {
                var arr = Array<[String:Any]>()
                
                for item in (val as Array<Serializable>) {
                    arr.append(item.toDictionary())
                }
                
                dict[prop] = arr as AnyObject
            }
        }
        
        return dict
    }
}
