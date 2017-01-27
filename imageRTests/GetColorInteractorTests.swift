//
//  GetColorInteractorTests.swift
//  imageR
//
//  Created by Sayeed Munawar Hussain on 27/01/17.
//  Copyright © 2017 *. All rights reserved.
//

import XCTest

class GetColorInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetColorForImageAtPath() {
        
        let exp = expectation(description: "getColorsForImage")

        let output = GetColorInteractorOutputImpl()
        output.completion = {
            exp.fulfill()
        }
        
        let interactor = GetColorInteractor()
        interactor.output = output
        
        interactor.getColorsForImageAtPath("hahaha")
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
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
    
    class GetColorInteractorOutputImpl: GetColorInteractorOutput {

        var completion: (() -> ())?
        
        func colorsForImage(_ info: ImageColor) {
            print("blah")
            completion!()
        }
    }
}
