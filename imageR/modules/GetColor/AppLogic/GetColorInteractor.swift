//
//  GetColorInteractor.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

class GetColorInteractor: NSObject {

    var output : GetColorInteractorOutput?
}

extension GetColorInteractor: GetColorInteractorInput {
    
    func getColorsForImageAtPath(_ path: String) {
        output?.colorsForImage(ImageColor(source: "", colors: [:]))
    }
}
