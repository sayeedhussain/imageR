//
//  APIResponseClientErrorChecker.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 14/02/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation

class APIResponseErrorParser {
    
    func parse(_ response: APIResponse) -> APIError? {
        
        if let error = response.error {
            
            let desc = error.localizedDescription
            
            if desc.lowercased().contains("internet") {
                return APIErrorC(url: response.url, userMsg: APIConstants.NoNetworkMessage)
            }
            
            return APIErrorC(url: response.url, errorMsg: error.localizedDescription)
            
        }
        
        return nil
    }
}
