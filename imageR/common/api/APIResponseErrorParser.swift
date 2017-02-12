//
//  APIResponseErrorParser.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 26/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

protocol APIResponseErrorParser: class {
    
    static func parseErrorResponse(_ json: Any) -> Dictionary<String, String>
    
    static var errorReponseKeys: Array<String> { get }
}
