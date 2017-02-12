//
//  APIInterfaceHelper.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 11/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

class APIClient {
    
    class func getWithURL(_ url: String, completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.getWithURL(url) { response in
            let apiResponse = APIResponseTransformer.transformResponse(response: response)
            APIResponseHandler.handleAPIResponse(apiResponse, completion: completion)
        }
    }
    
    class func getWithURL(_ url: String, headers: [String: String], completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.getWithURL(url, headers: headers) { response in
            let apiResponse = APIResponseTransformer.transformResponse(response: response)
            APIResponseHandler.handleAPIResponse(apiResponse, completion: completion)
        }
    }

    class func getWithURL(_ url: String, params: [String : Any], completion: @escaping ((Any?, APIError?) -> ())) {

        NetworkingLibrary.getWithURL(url, params: params) { response in
            let apiResponse = APIResponseTransformer.transformResponse(response: response)
            APIResponseHandler.handleAPIResponse(apiResponse, completion: completion)
        }
    }

    class func getWithURL(_ url: String, params: [String : Any], headers: [String: String], completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.getWithURL(url, params: params, headers: headers) { response in
            let apiResponse = APIResponseTransformer.transformResponse(response: response)
            APIResponseHandler.handleAPIResponse(apiResponse, completion: completion)
        }
    }

    class func postWithURL(_ url: String, params: [String : Any], completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.postWithURL(url, params: params) { response in
            let apiResponse = APIResponseTransformer.transformResponse(response: response)
            APIResponseHandler.handleAPIResponse(apiResponse, completion: completion)
        }
    }
    
    class func postWithURL(_ url: String, params: [String : Any], headers: [String : String], completion: @escaping ((Any?,
        APIError?) -> ())) {
                
        NetworkingLibrary.postWithURL(url, params: params, headers: headers) { response in
            let resp = APIResponse(url: url, status: response.response?.statusCode, result: response.result.value, error: response.result.error)
            APIResponseHandler.handleAPIResponse(resp, completion: completion)
        }
    }
}
