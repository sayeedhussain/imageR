//
//  APIResponseInterpretor.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 12/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

class APIResponseHandler {
    
    class func handleAPIResponse(_ response: APIResponse, completion:((Any?, APIError?) -> ())) {
        
        guard let error = response.error else {
            
            guard let json = response.result else {
                
                let err = APIError(url: response.url, errorMsg: "Response yielded neither error nor value.")
                completion(nil, err)//send the error upstream
                return
            }
            
            guard let statusCode = response.status else {
                
                let err = APIError(url: response.url, errorMsg: "Response status code is nil.")
                completion(nil, err)//send the error upstream
                return
            }
            
            if statusCode == 200 {//now validate response body for success.
                completion(json, nil)//send the result upstream
                return
            }
            
            //                print("\(json)")
            
            if self is APIResponseErrorParser {

                //get APIError from result object and send it upstream
                let dict = self.parseErrorResponse(json)

                //look for user message in JSON object.
                let usrMsg = dict[UserMessageKey] ?? APIError.GenericMessage
                let devMsg = dict[DeveloperMessageKey] ?? APIError.GenericMessage
                
                let err = APIError(url: response.url, userMsg: usrMsg, errorMsg: devMsg, statusCode: statusCode)
                completion(nil, err)//send the error upstream
            }
            
            
            //handle error status code
            if self is APIResponseErrorStatusCodeHandler {
                self.handleErrorStatusCode(statusCode)
            }
            
            return
        }
        
        //failure. api request couldn't be completed. possible reasons may include no netwtork, timeout, server down etc.
        if (error.localizedDescription as NSString).lowercased.contains("internet") {
            
            let err = APIError(url: response.url, userMsg: APIError.NoNetworkMessage)
            completion(nil, err)//send the error upstream
            return
        }
        
        let err = APIError(url: response.url, errorMsg: error.localizedDescription)
        completion(nil, err)//send the error upstream
    }
}

extension APIResponseHandler: APIResponseErrorParser {
   
    static let UserMessageKey = "userMsg"
    static let DeveloperMessageKey = "developerMessage"
    
    internal static func parseErrorResponse(_ json: Any) -> Dictionary<String, String> {
        
        var retVal = Dictionary<String, String>()

        //convert to dictionary
        guard let dict = json as? Dictionary<String, String> else {
            return retVal
        }
        
        for key in self.errorReponseKeys {
            
            if let value = dict[key]  {
                retVal[key] = value
            }
            
        }
        
        return retVal
    }
   
    internal static var errorReponseKeys: Array<String> {
        return [UserMessageKey, DeveloperMessageKey]
    }
}

extension APIResponseHandler: APIResponseErrorStatusCodeHandler {
    
    internal static func handleErrorStatusCode(_ code: Int) {
        
        switch code {
            
        case 401:
//           NotificationCenter.default.post(name: NSNotification.Name("Authentication_Failure"), object: nil)
            break
            
        default:
            break
        }
        
    }
}
