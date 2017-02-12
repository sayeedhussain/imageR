//
//  APIResponseCodeHandler.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 26/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

protocol APIResponseErrorStatusCodeHandler: class {
    
    static func handleErrorStatusCode(_ code: Int)
}
