//
//  APIGateway.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 08/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Alamofire

class NetworkingLibrary {
    
    class func getWithURL(_ url: String, completion:@escaping ((DataResponse<Any>) -> ()))  {
        
        Alamofire.request(url).responseJSON { response in
            
            DispatchQueue.global().async {
                completion(response)
            }
        }
    }

    class func getWithURL(_ url: String, headers: [String: String], completion:@escaping ((DataResponse<Any>) -> ()))  {
        
        Alamofire.request(url, headers: headers).responseJSON { response in
           
            DispatchQueue.global().async {
                completion(response)
            }
        }
    }

    class func getWithURL(_ url: String, params: [String : Any], completion:@escaping ((DataResponse<Any>) -> ())) {
        
        Alamofire.request(url, parameters: params).responseJSON { response in
           
            DispatchQueue.global().async {
                completion(response)
            }
        }
        
    }
    
    class func getWithURL(_ url: String, params: [String : Any], headers: [String: String], completion:@escaping ((DataResponse<Any>) -> ())) {
        
        Alamofire.request(url, parameters: params, headers: headers).responseJSON { response in
            
            DispatchQueue.global().async {
                completion(response)
            }
        }
    }
    
    class func postWithURL(_ url: String, params: [String : Any], completion:@escaping ((DataResponse<Any>) -> ())) {
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            
            DispatchQueue.global().async {
                completion(response)
            }
        }
    }
    
    class func postWithURL(_ url: String, params: [String : Any], headers: [String : String], completion:@escaping ((DataResponse<Any>) -> ())) {
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
           
            DispatchQueue.global().async {
                completion(response)
            }
        }
    }    
}
