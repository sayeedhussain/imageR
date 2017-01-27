//
//  Color.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import Foundation

struct ColorIM {
    
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
    let name: String?

}

extension ColorIM: Hashable {
    
    var hashValue: Int {
        return red.hashValue ^ green.hashValue ^ blue.hashValue ^ alpha.hashValue
    }
}

extension ColorIM: Equatable {
    
    static func ==(lhs: ColorIM, rhs: ColorIM) -> Bool {
        return lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue && lhs.alpha == rhs.alpha
    }
}
