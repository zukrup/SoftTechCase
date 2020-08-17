//
//  ApiRequestService.swift
//  MyX
//
//  Created by Musa Fedakar on 12/05/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class ApiRequestService : ApiOperation {
    
    //var URL_ACTIVE = "http://windows-10/mgn/"
    var URL_ACTIVE = "https://api.github.com/"
    var apiRequestCommand : ApiRequestCommand?
    
    override func main() {
        
        executing(true)
        
        if (apiRequestCommand == nil) {
            return
        }
        else if let Command = apiRequestCommand?.apiCommandType {
            switch (Command) {
            case ApiRequestCommandType.get_repos:
                get_repos()
                break
            case ApiRequestCommandType.get_user:
                break
            case ApiRequestCommandType.get_user_repos:
                break
            default:
                break
            }
        }
    }
    
    func getServiceEndPointAddress() -> URLConvertible {
        
        var retval : String = self.URL_ACTIVE
        if let methodName = self.apiRequestCommand?.getMethodName() {
            retval += methodName
        }
        return retval
    }
    
    fileprivate func get_repos() {
        
        var repo_request : [String: AnyObject] = [:]
        if let qobj = self.apiRequestCommand?.queryObject as? BaseRequest {
            repo_request = qobj.toDictionary()
        }
         
        
        AF.request(getServiceEndPointAddress(), method: .get, parameters: repo_request)
            .validate().responseJSON { (data) in
                
                
                if let _ = data.error {
                    self.apiRequestCommand?.apiResponseState = ApiRequestResponseState.error
                    self.handle_api_response(data: data)
                    
                }
                
                if let datavalue = data.value {
                    self.apiRequestCommand?.apiResponseState = ApiRequestResponseState.success
                    let jsonResult = JSON(datavalue)
                    do {
                        let returnObj = RepoResponseObjectList<Repo>(json: jsonResult, objectList: try JSONDecoder().decode([Repo].self, from: jsonResult["items"].rawData()))
                        returnObj.isSucceeded = true
                        
                        self.apiRequestCommand?.returnObject = returnObj
                    }
                    catch {
                        print(error)
                        self.handle_api_response(data: data)
                    }
                }
                 
                self.complete_operation()
        }
        
    }
        
    fileprivate func handle_api_response(data : AFDataResponse<Any>) {
        
        let responseErrorObj = RepoResponse()
         
        
        if let statuscode = data.response?.statusCode {
            switch statuscode {
            case 408:
                self.apiRequestCommand?.apiResponseState = ApiRequestResponseState.timeout
                responseErrorObj.isSucceeded = false
                break
            case 400:
                self.apiRequestCommand?.apiResponseState = ApiRequestResponseState.error
                responseErrorObj.isSucceeded = false
                break
            default:
                responseErrorObj.isSucceeded = false
                self.apiRequestCommand?.apiResponseState = ApiRequestResponseState.error
                break
            }
            
        }
        else {
            self.apiRequestCommand?.apiResponseState = ApiRequestResponseState.error
        }
        
        self.apiRequestCommand?.returnObject = responseErrorObj
    }
    
    
}

