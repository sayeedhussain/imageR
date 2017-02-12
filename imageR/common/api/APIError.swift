//
//  APIError.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 11/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

public let APIErrorDomain = "APIErrorDomain"

struct APIError: Error {

    static let GenericMessage = "Something went wrong. Please retry."
    static let NoNetworkMessage = "Internet connection appears to be offline."

    let domain: String = APIErrorDomain
    var statusCode: Int = 0
    
    var userMessage: String = GenericMessage
    var errorMessage: String = GenericMessage

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

extension APIError: CustomStringConvertible {
 
    var description: String {
        return "Domain: \(self.domain), ErrorMessage: \(self.errorMessage), URL: \(self.url), StatusCode: \(self.statusCode)"
    }
}
