//
//  MgnRequest.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation

class BaseRequest : Serializable {
    
    public init() {
        
        self.DrawTicket = String.init()
        self.Page = 0
        self.PageSize = 0
        self.TotalCount = 0
        self.IncludeRecordUser = false
        self.QueryString = ""
    }
    
    var DrawTicket : String
    var TotalCount : Int
    var Page : Int
    var PageSize : Int
    var QueryString : String
    var IncludeRecordUser : Bool
    var MemberDescriptors : [FilterDescriptor]?
    
    //q=retrofit&per_page=10&page=2
    var properties: Array<String> = [ "q", "per_page", "page" ]
    
    func valueForKey(key: String) -> AnyObject? {
        switch key {
        case "q":
            return self.QueryString as AnyObject
        case "per_page":
            return self.PageSize as AnyObject
        case "page":
            return self.Page as AnyObject
            
        default:
            return 0 as AnyObject
        }
    }
}

 
