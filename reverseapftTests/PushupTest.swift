//
//  PushupsTest.swift
//  reverseapftTests
//
//  Created by Zachary Gorak on 3/2/18.
//  Copyright © 2018 twodayslate. All rights reserved.
//

import XCTest

class PushupTests: XCTestCase {
    
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
		var score = Score.score(forPushups: 72)
		XCTAssert(score == 100, "72: \(score) != 100")
		XCTAssert(Score.score(forPushups: 71) == 100)
		XCTAssert(Score.score(forPushups: 70) == 99)
		score = Score.score(forPushups: 69)
		XCTAssert(score == 97, "69: \(score) != 97")
		score = Score.score(forPushups: 68)
		XCTAssert(score == 96, "68: \(score) != 96")
		score = Score.score(forPushups: 67)
		XCTAssert(score == 94, "67: \(score) != 94")
		XCTAssert(Score.score(forPushups: 21) == 31)
		XCTAssert(Score.score(forPushups: 20) == 30)
	}
	
	func testPushups() {
		Score.age = 21
		Score.gender = .male
		XCTAssert(Score.pushups(forScore: 100) == 71, "\(Score.pushups(forScore: 100))")
		XCTAssert(Score.pushups(forScore: 99) == 70, "\(Score.pushups(forScore: 99))")
		XCTAssert(Score.pushups(forScore: 98) == 70, "\(Score.pushups(forScore: 98))")
		XCTAssert(Score.pushups(forScore: 97) == 69, "\(Score.pushups(forScore: 97))")
		XCTAssert(Score.pushups(forScore: 96) == 68, "\(Score.pushups(forScore: 96))")
		XCTAssert(Score.pushups(forScore: 95) == 68, "\(Score.pushups(forScore: 95))")
		XCTAssert(Score.pushups(forScore: 94) == 67, "\(Score.pushups(forScore: 93))")
		XCTAssert(Score.pushups(forScore: 93) == 66, "\(Score.pushups(forScore: 92))")
		XCTAssert(Score.pushups(forScore: 92) == 65, "\(Score.pushups(forScore: 91))")
		
		XCTAssert(Score.pushups(forScore: 38) == 26, "\(Score.pushups(forScore: 38))")
		XCTAssert(Score.pushups(forScore: 37) == 25, "\(Score.pushups(forScore: 37))")
		XCTAssert(Score.pushups(forScore: 36) == 25, "\(Score.pushups(forScore: 36))")
		XCTAssert(Score.pushups(forScore: 35) == 24, "\(Score.pushups(forScore: 35))")
		XCTAssert(Score.pushups(forScore: 34) == 23, "\(Score.pushups(forScore: 34))")
		XCTAssert(Score.pushups(forScore: 33) == 23, "\(Score.pushups(forScore: 33))")
		XCTAssert(Score.pushups(forScore: 32) == 22, "\(Score.pushups(forScore: 32))")
		XCTAssert(Score.pushups(forScore: 31) == 21, "\(Score.pushups(forScore: 31))")
		XCTAssert(Score.pushups(forScore: 30) == 20, "\(Score.pushups(forScore: 30))")
		XCTAssert(Score.pushups(forScore: 9) == 5, "\(Score.pushups(forScore: 9))")
		XCTAssert(Score.pushups(forScore: 8) == 5, "\(Score.pushups(forScore: 8))")
		XCTAssert(Score.pushups(forScore: 0) == 0, "\(Score.pushups(forScore: 0))")
	}
    
}
