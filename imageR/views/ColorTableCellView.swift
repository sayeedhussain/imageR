//
//  ColorTableCellView.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

class ColorTableCellView: NSTableCellView {
    
    @IBOutlet private weak var colorView: BGColorView!
    @IBOutlet private weak var titleLbl: NSTextField!
    
    func setColor(_ color: NSColor) {
        colorView.color = color
        colorView.setNeedsDisplay(colorView.frame)
    }
    
    func setText(_ text: String) {
        titleLbl.stringValue = text
    }
}
