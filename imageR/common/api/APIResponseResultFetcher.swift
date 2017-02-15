//
//  APIResponseResultFetcher.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 14/02/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation

class APIResponseResultFetcher {
    
    func fetch(_ response: APIResponse) -> Any? {

        if let status = response.status, status == 200, let result = response.result {
            return result
        }
        
        return nil
    }
}
