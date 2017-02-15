//
//  APIInterfaceHelper.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 11/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

class APIClient {
    
    func getWithURL(_ url: String, completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.getWithURL(url) { response in
            
            let apiResponse = APIResponseTransformer().transform(response)

            APIResponseHandler().handle(apiResponse) { result, error in
                completion(result, error)
            }
        }
    }
    
    func getWithURL(_ url: String, headers: [String: String], completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.getWithURL(url, headers: headers) { response in
            
            let apiResponse = APIResponseTransformer().transform(response)
            
            APIResponseHandler().handle(apiResponse) { result, error in
                completion(result, error)
            }
        }
    }

    func getWithURL(_ url: String, params: [String : Any], completion: @escaping ((Any?, APIError?) -> ())) {

        NetworkingLibrary.getWithURL(url, params: params) { response in
           
            let apiResponse = APIResponseTransformer().transform(response)
            
            APIResponseHandler().handle(apiResponse) { result, error in
                completion(result, error)
            }
        }
    }

    func getWithURL(_ url: String, params: [String : Any], headers: [String: String], completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.getWithURL(url, params: params, headers: headers) { response in
            
            let apiResponse = APIResponseTransformer().transform(response)
            
            APIResponseHandler().handle(apiResponse) { result, error in
                completion(result, error)
            }
        }
    }

    func postWithURL(_ url: String, params: [String : Any], completion: @escaping ((Any?, APIError?) -> ())) {
        
        NetworkingLibrary.postWithURL(url, params: params) { response in
            
            let apiResponse = APIResponseTransformer().transform(response)
            
            APIResponseHandler().handle(apiResponse) { result, error in
                completion(result, error)
            }
        }
    }
    
    func postWithURL(_ url: String, params: [String : Any], headers: [String : String], completion: @escaping ((Any?,
        APIError?) -> ())) {
                
        NetworkingLibrary.postWithURL(url, params: params, headers: headers) { response in
            
            let apiResponse = APIResponseTransformer().transform(response)
            
            APIResponseHandler().handle(apiResponse) { result, error in
                completion(result, error)
            }
        }
    }
}
