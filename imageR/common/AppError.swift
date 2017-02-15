//
//  AppError.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 15/02/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation

protocol APPError: Error, CustomStringConvertible {
    
    var errorMessage: String {get}
}
