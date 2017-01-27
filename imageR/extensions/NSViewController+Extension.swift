//
//  NSViewController+Extension.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Cocoa

extension NSViewController {
    
    func setBackgroundColor(_ color: CGColor) {
        
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = color
        }
    }
}
