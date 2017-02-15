//
//  APIResponseInterpretor.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 12/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

class APIResponseHandler {
    
     func handle(_ response: APIResponse, completion:((Any?, APIError?) -> ())) {
        
        if let err = APIResponseSanityChecker().check(response) {
            completion(nil, err)
            return
        }
        
        if let err = APIResponseErrorParser().parse(response) {
            completion(nil, err)
            return
        }
        
        if let err = APIResponseServerErrorParser().parse(response) {
            completion(nil, err)
            return
        }
        
        if let result = APIResponseResultFetcher().fetch(response) {
            completion(result, nil)
        }
        
        
        APIResponseStatusCodeHandler().handle(response)
    }
    
}
