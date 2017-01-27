//
//  Image.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

struct Image {

    let id: String
    let source: String
    
    var cachePath: String?
    var colors: Dictionary<ColorIM, Float>?
    var date: Double?
    var tags: [TagUser]?
    var notes: String?
    
    //TODO: Add protocol conformance to equatable
}
