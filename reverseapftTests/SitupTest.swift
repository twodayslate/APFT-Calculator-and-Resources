//
//  SitupsTest.swift
//  reverseapftTests
//
//  Created by Zachary Gorak on 3/2/18.
//  Copyright © 2018 twodayslate. All rights reserved.
//

import XCTest

class SitupTests: XCTestCase {
    
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
		var score = Score.score(forSitups: 79)
		XCTAssert(score == 100, "79: \(score) != 100")
		score = Score.score(forSitups: 78)
		XCTAssert(score == 100, "78: \(score) != 100")
		score = Score.score(forSitups: 77)
		XCTAssert(score == 98, "77: \(score) != 98")
		score = Score.score(forSitups: 76)
		XCTAssert(score == 97, "76: \(score) != 97")
		
		score = Score.score(forSitups: 75)
		XCTAssert(score == 95, "75: \(score) != 95")
		
		score = Score.score(forSitups: 74)
		XCTAssert(score == 94, "74: \(score) != 94")
		
		score = Score.score(forSitups: 73)
		XCTAssert(score == 92, "73: \(score) != 92")
		
		score = Score.score(forSitups: 68)
		XCTAssert(score == 84, "68: \(score) != 84")
		score = Score.score(forSitups: 35)
		XCTAssert(score == 31, "35: \(score) != 31")
		score = Score.score(forSitups: 34)
		XCTAssert(score == 30, "34: \(score) != 30")
		XCTAssert(Score.score(forSitups: 33) == 28)
		XCTAssert(Score.score(forSitups: 23) == 12)
	}
	
	func testSitups() {
		Score.age = 21
		Score.gender = .male
		XCTAssert(Score.situps(forScore: 100) == 78)
		XCTAssert(Score.situps(forScore: 99) == 78)
		XCTAssert(Score.situps(forScore: 98) == 77)
		XCTAssert(Score.situps(forScore: 97) == 76)
		XCTAssert(Score.situps(forScore: 96) == 76)
		XCTAssert(Score.situps(forScore: 95) == 75)
		XCTAssert(Score.situps(forScore: 94) == 74)
		
		XCTAssert(Score.situps(forScore: 30) == 34)
	}    
}
