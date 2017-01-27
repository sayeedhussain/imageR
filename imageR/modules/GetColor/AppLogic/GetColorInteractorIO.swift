//
//  GetColorInteractorIO.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

protocol GetColorInteractorInput {
    
    func getColorsForImageAtPath(_ path: String)
}

protocol GetColorInteractorOutput {
    
    func colorsForImage(_ info: ImageColor)
}
