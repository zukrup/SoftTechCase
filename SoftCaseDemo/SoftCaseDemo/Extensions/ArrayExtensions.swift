//
//  ArrayExtensions.swift
//  MyX
//
//  Created by Musa Fedakar on 01/07/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation

// MARK: - Array

extension Array {
    
    mutating func removeObject<U: Equatable> (_ object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.remove(at: index!)
        }
    }
    
    // Safely lookup an index that might be out of bounds,
    // returning nil if it does not exist
    func get(_ index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
    
}

extension Array where Element:Equatable {
    func distinct() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}
