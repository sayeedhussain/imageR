//
//  APIResponse.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

struct APIResponse {
    
    var url: String
    var status: Int? = 0
    var result: Any?
    var error: Error?
    
    init(url _url: String, result _res: Any?, error _err: Error?) {
        self.url = _url
        self.result = _res
        self.error = _err
    }
    
    init(url _url: String, status _status: Int?, result _res: Any?, error _err: Error?) {
        self.url = _url
        self.status = _status
        self.result = _res
        self.error = _err
    }
}
