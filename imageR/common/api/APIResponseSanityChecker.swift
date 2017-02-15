//
//  APIResponseSanityChecker.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 14/02/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation

class APIResponseSanityChecker {
    
    func check(_ response: APIResponse) -> APIError? {
        
        let error = response.error
        let result = response.result

        if error == nil, result == nil {
            return APIErrorC(url: response.url, errorMsg: "Response yielded neither error nor value.")
        }

        if let _ = error, let _ = result {
            return APIErrorC(url: response.url, errorMsg: "Response yielded both error and value.")
        }
        
        return nil
    }
}
