//
//  BGColorView.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 26/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

class BGColorView: NSView {

    var color: NSColor?
    
    override func draw(_ dirtyRect: NSRect) {
        
        if let _color = color {
            _color.setFill()
            NSRectFill(dirtyRect)
        }
        
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
