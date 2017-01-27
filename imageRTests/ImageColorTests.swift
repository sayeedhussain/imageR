//
//  ImageColorTests.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import XCTest

class ImageColorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testColorCreate1() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        
        let color = Color(red: red, green: green, blue: blue, alpha: alpha)
        XCTAssert(color.red == red)
        XCTAssert(color.green == green)
        XCTAssert(color.blue == blue)
        XCTAssert(color.alpha == alpha)
        XCTAssert(color.name == nil)
    }

    func testColorCreate2() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        let name = "Cyan"
        
        let color = Color(red: red, green: green, blue: blue, alpha: alpha, name: name)
        XCTAssert(color.red == red)
        XCTAssert(color.green == green)
        XCTAssert(color.blue == blue)
        XCTAssert(color.alpha == alpha)
        XCTAssert(color.name == name)
    }
    
    func testColorEquality1() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        
        let color1 = Color(red: red, green: green, blue: blue, alpha: alpha)
        let color2 = Color(red: red, green: green, blue: blue, alpha: alpha)

        XCTAssert(color1 == color2)
    }

    func testColorEquality2() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        let name = "Cyan"

        let color1 = Color(red: red, green: green, blue: blue, alpha: alpha)
        let color2 = Color(red: red, green: green, blue: blue, alpha: alpha, name: name)
        
        XCTAssert(color1 == color2)
    }

    func testColorInEquality() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        let name = "Cyan"
        
        let red2: CGFloat = 0.2

        let color1 = Color(red: red, green: green, blue: blue, alpha: alpha)
        let color2 = Color(red: red2, green: green, blue: blue, alpha: alpha, name: name)
        
        XCTAssert(color1 != color2)
    }
    
    func testColorHashability1() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        let name = "Cyan"
        
        let color1 = Color(red: red, green: green, blue: blue, alpha: alpha)
        let color2 = Color(red: red, green: green, blue: blue, alpha: alpha, name: name)
        
        var dict = [color1 : 0.1]
        dict[color2] = 0.2
        
        XCTAssert(dict[color1] == 0.2)
    }

    func testColorHashability2() {
        
        let red: CGFloat = 0.1
        let green: CGFloat = 0.2
        let blue: CGFloat = 0.3
        let alpha: CGFloat = 0.4
        let name = "Cyan"
        
        let red2: CGFloat = 0.2
        
        let color1 = Color(red: red, green: green, blue: blue, alpha: alpha)
        let color2 = Color(red: red2, green: green, blue: blue, alpha: alpha, name: name)
        
        var dict = [color1 : 0.1]
        dict[color2] = 0.2
        
        XCTAssert(dict[color1] == 0.1)
        XCTAssert(dict[color2] == 0.2)
    }


//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
