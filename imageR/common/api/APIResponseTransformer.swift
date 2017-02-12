//
//  APIResponseTransformer.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation
import Alamofire

class APIResponseTransformer {
    
    static func transformResponse(response :DataResponse<Any>) -> APIResponse {
        
        return APIResponse(url: (response.request?.url?.absoluteString)!, status: response.response?.statusCode, result: response.result.value, error: response.result.error)
    }
}
