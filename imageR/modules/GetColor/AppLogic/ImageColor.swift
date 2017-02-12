//
//  Color.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation

struct ImageColor {
    
    let source: String
    let colors: Array<NSColor>
}

struct Color {
    
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
    let name: String?
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        self.name = nil
    }
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat, name: String?) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        self.name = name
    }
}

extension Color: Hashable {
    
    var hashValue: Int {
        return red.hashValue ^ green.hashValue ^ blue.hashValue ^ alpha.hashValue
    }
}

extension Color: Equatable {
    
    static func ==(lhs: Color, rhs: Color) -> Bool {
        return lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue && lhs.alpha == rhs.alpha
    }
}
