//
//  URLConstants.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 08/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

class APIURLs {
    
    private let HttpProtocol = "https"
    private let HttpHost = "www.assetplus.io"

    private let HttpHostSuffix = "appserver"
    private let HttpVersion = "v1"

    func UrlPrefix() -> String {
        return HttpProtocol + "://" + HttpHost + "/" + HttpHostSuffix + "/" + HttpVersion
    }
    
//    static func UrlPrefix() -> String {
//        return "http://localhost:3000"
//    }

    func loginURL() -> String {
        return UrlPrefix() + "/auth/login"
    }
}
