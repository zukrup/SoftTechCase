//
//  ApiRequestCommand.swift
//  BaylanMgn
//
//  Created by musa fedakar on 12.08.2018.
//  Copyright © 2018 musa fedakar. All rights reserved.
//

import Foundation
import UIKit

class ApiRequestCommand : NSObject {
    
    var apiCommandType : ApiRequestCommandType?
    var apiResponseState : ApiRequestResponseState?
    var queryObject : AnyObject?
    var returnObject : AnyObject?
    
    init(ct: ApiRequestCommandType) {
        self.apiCommandType = ct
    }
    
    func showProgressDialog() -> Bool {
        
        switch self.apiCommandType! {
        default:
            return true
        }
        
    }
    
    func getMethodName() -> String {
        
        var retval : String = String.init()
        
        switch (self.apiCommandType!) {
        case ApiRequestCommandType.get_repos:
            retval = "search/repositories"
            break
        case ApiRequestCommandType.get_user:
            retval = "users/"
            break
        case ApiRequestCommandType.get_user_repos:
            retval = "users/"
            break
        default:
            break
        }
        return retval
    }
    
}
