//
//  GetColorNetworkManager.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

class GetColorManager: NSObject {

    func getColorsForImage(image: NSImage, completion:@escaping ([NSColor]?, Error?)->()) {
        
        DispatchQueue.global(qos: .default).async {
            let colors = image.dominantColors()
            completion(colors, nil)
        }
    }
}
