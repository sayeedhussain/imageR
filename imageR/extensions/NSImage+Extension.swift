//
//  NSImage+Extension.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

extension NSImage {
    
    func resizeImage(toSize: CGSize) -> NSImage {
        
        let img = NSImage(size: toSize)
        
        img.lockFocus()
        let ctx = NSGraphicsContext.current()
        ctx?.imageInterpolation = .high
        self.draw(in: NSRect(x: 0, y: 0, width: toSize.width, height: toSize.height), from: NSRect(x: 0, y: 0, width: self.size.width, height: self.size.height), operation: .copy, fraction: 1)
        img.unlockFocus()
        
        return img
    }
}
