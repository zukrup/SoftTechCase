//
//  FilterOrderDescriptors.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation

class FilterDescriptor : Serializable {

    var MemberName : String?
    var MemberType : String?
    var Value : String?
    var MemberOperator : Int?

    var properties: Array<String> = [ "MemberName", "MemberType", "Value", "MemberOperator" ]
    
    func valueForKey(key: String) -> AnyObject? {
        switch key {
        case "MemberName":
            return self.MemberName as AnyObject
        case "MemberType":
            return self.MemberType as AnyObject
        case "Value":
            return self.Value as AnyObject
        case "MemberOperator":
            return self.MemberOperator as AnyObject
        default:
            return 0 as AnyObject
        }
    }
}

class OrderDescriptor {
    
    var OrderColumn : String?
    var OrderDirection : String?

}

public enum QueryOperator : Int
{
   case IsLessThan
   case IsLessThanOrEqualTo
   case IsEqualTo
   case IsNotEqualTo
   case IsGreaterThanOrEqualTo
   case IsGreaterThan
   case StartsWith
   case EndsWith
   case Contains
   case IsContainedIn
   case DoesNotContain
}
