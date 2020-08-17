//
//  TokenResponse.swift
//  BaylanMgn
//
//  Created by musa fedakar on 16.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation

class ApiToken : Codable {
    
    var access_token : String?
    var token_type : String?
    var expires_in : Int64
    var issued : Date?
    var expires : Date?
    var user_id : String?
    var first_name : String?
    var last_name : String?
    
    init() {
        self.access_token = String.init()
        self.expires_in = 0
    }
    
    init(json: JSON) {
        self.access_token = json["access_token"].stringValue
        self.token_type = json["token_type"].stringValue
        self.expires_in = json["expires_in"].int64Value
        self.issued = Scully.sharedInstance.TokenStringToDate(json[".issued"].string)
        self.expires = Scully.sharedInstance.TokenStringToDate(json[".expires"].string)
        self.user_id = json["user_id"].string
        self.first_name = json["first_name"].string
        self.last_name = json["last_name"].string
    }
    /*
    func valueForKey(key: String) -> Any? {
        
    }
    
    var properties: Array<String> {
        return ["access_token", "user_id", "issued", "expires" ]
    }
    
    var toJsonString : String {
        let data =  try! JSONSerialization.data(withJSONObject: toDictionary(), options: [])
        return String(data:data, encoding:.utf8)!
    }
    */
}

 
