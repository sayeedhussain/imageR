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
    let getColorNetworkManager = GetColorManager()
}

extension GetColorInteractor: GetColorInteractorInput {
    
    func getColorsForImageAtPath(_ path: String) {
        
        guard let image = NSImage(contentsOfFile: path) else {
            output?.colorsForImage(ImageColor(source: path, colors: [NSColor]()))
            return
        }
        
        getColorNetworkManager.getColorsForImage(image: image) { colors, error in

            if let error = error {
                print("\(error)")
                self.output?.colorsForImage(ImageColor(source: path, colors: [NSColor]()))
                return
            }
            
            guard let colors = colors else {
                self.output?.colorsForImage(ImageColor(source: path, colors: [NSColor]()))
                return
            }
            
            self.output?.colorsForImage(ImageColor(source: path, colors: colors))
        }
    }
}
