//
//  APIResponse.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

protocol APIResponse {
    
    var url: String {get}
    var status: Int? {get}
    var result: Any? {get}
    var error: Error? {get}
}

struct APIResponseC: APIResponse {
    
    var url: String
    var status: Int?
    var result: Any?
    var error: Error?
    
    init(url _url: String, status _status: Int? = 0, result _res: Any?, error _err: Error?) {
        self.url = _url
        self.status = _status
        self.result = _res
        self.error = _err
    }
}
