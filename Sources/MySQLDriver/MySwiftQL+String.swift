//
//  FixedLengthString.swift
//  MySQLDriver
//
//  Created by Robert Schmid  on 9/8/17.
//
//

import Foundation

extension String
{
	var maxLength: Int? {
		get {
			return self.maxLength
		}
		set(newValue) {
			self.maxLength = newValue
		}
	}
	
	init(maxLength: Int)
	{
		self.init()
		self.maxLength = maxLength
	}
}
