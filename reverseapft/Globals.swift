//
//  Globals.swift
//  reverseapft
//
//  Created by Zachary Gorak on 2/20/18.
//  Copyright © 2018 twodayslate. All rights reserved.
//

import Foundation

func printd(_ items: Any..., callingFunction : String = #function, file : String = #file, line : Int = #line) {
	#if DEVELOP || DEBUG || !PRODCTN
		let s = items.map { String(describing: $0) }.joined(separator: " ")
		let shortfile = file.split(separator: ".").dropLast().last!
		let shortfunction = callingFunction.split(separator: "(").first!
		Swift.print("[\(shortfile)/\(shortfunction):\(line)] " + s)
	#endif
}
