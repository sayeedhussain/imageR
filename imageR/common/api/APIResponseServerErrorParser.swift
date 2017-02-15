//
//  APIResponseErrorParser.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 26/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

class APIResponseServerErrorParser {
    
    private let UserMsgKey = "userMsg"
    private let DeveloperMessageKey = "developerMessage"

    typealias Dict = Dictionary<String, String>
    
    func parse(_ response: APIResponse) -> APIError? {
        
        var retVal = Dict()
        
        if let dict = response.result as? Dict {
            
            for key in self.errorReponseKeys {
                
                if let value = dict[key]  {
                    retVal[key] = value
                }
            }
            
            if retVal.count > 0 {//server returned error
                return errorForDict(retVal, response: response)
            }

            return nil
        }
        
        return nil
    }
    
    private var errorReponseKeys: Array<String> {
        return [UserMsgKey, DeveloperMessageKey]
    }
    
    private func errorForDict(_ dict: Dict, response: APIResponse) -> APIError? {
        
        let usrMsg = dict[UserMsgKey] ?? APIConstants.GenericMessage
        let devMsg = dict[DeveloperMessageKey] ?? APIConstants.GenericMessage
        let status = response.status ?? 0
        
        return APIErrorC(url: response.url, userMsg: usrMsg, errorMsg: devMsg, statusCode: status)
    }
}
