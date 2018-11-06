//
//  reverseapftTests.swift
//  reverseapftTests
//
//  Created by twodayslate on 10/14/14.
//  Copyright (c) 2014 twodayslate. All rights reserved.
//

import UIKit
import XCTest

class runTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testScore() {
		Score.age = 21
		Score.gender = .male
        XCTAssertEqual(Score.score(forRun: 1200), 100)
		XCTAssertEqual(Score.score(forRun: 1299), 100)
		XCTAssertEqual(Score.score(forRun: 1300), 100)
		XCTAssertEqual(Score.score(forRun: 1301), 99)
		XCTAssertEqual(Score.score(forRun: 1306), 99)
		XCTAssertEqual(Score.score(forRun: 1307), 97)
		XCTAssertEqual(Score.score(forRun: 1312), 97)
		XCTAssertEqual(Score.score(forRun: 1400), 86)
		XCTAssertEqual(Score.score(forRun: 1500), 72)
		XCTAssertEqual(Score.score(forRun: 1806), 30)
		XCTAssertEqual(Score.score(forRun: 1800), 31)
	}
}
