//
//  APIError.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 11/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

protocol APIError: APPError, UserError {
    
}

struct APIErrorC: APIError {

    var statusCode: Int = 0

    var errorMessage: String = APIConstants.GenericMessage
    var userMessage: String = APIConstants.GenericMessage

    var url: String

    init(url: String) {
        self.url = url
    }

    init(url: String, errorMsg: String) {
        self.url = url
        self.errorMessage = errorMsg
    }

    init(url: String, userMsg: String) {
        self.url = url
        self.userMessage = userMsg
    }

    init(url: String, userMsg: String, errorMsg: String) {
        self.url = url
        self.userMessage = userMsg
        self.errorMessage = errorMsg
    }

    init(url: String, errorMsg: String, statusCode: Int) {
        self.url = url
        self.errorMessage = errorMsg
        self.statusCode = statusCode
    }

    init(url: String, userMsg: String, errorMsg: String, statusCode: Int) {
        self.url = url
        self.userMessage = userMsg
        self.errorMessage = errorMsg
        self.statusCode = statusCode
    }
}

extension APIErrorC: CustomStringConvertible {
 
    var description: String {
        return "Domain: \(APIConstants.APIErrorDomain), ErrorMessage: \(self.errorMessage), URL: \(self.url), StatusCode: \(self.statusCode)"
    }
}
