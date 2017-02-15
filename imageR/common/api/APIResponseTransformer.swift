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
    
    func transform(_ response :DataResponse<Any>) -> APIResponse {

        return APIResponseC(url: (response.request?.url?.absoluteString)!, status: response.response?.statusCode, result: response.result.value, error: response.result.error)
    }
}
