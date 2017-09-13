//
//  TableModel.swift
//
//  Created by Robert Schmid  on 9/4/17.
//  Copyright © 2017 Robert Schmid . All rights reserved.
//

import Foundation

open class TableModel
{
	open var primaryKey: String?
	open var autoIncrement: Bool
	
	//Fixed Column Widths
	public typealias TinyText = String //maxLength = 2^8-1
	public typealias Text = String //maxLength = 2^16-1
	public typealias MediumText = String //maxLength = 2^24-1
	public typealias LongText = String //maxLength = 2^32-1
	
	//Variable Column Widths
	typealias VarChar = String //maxLength = (2^16-1 - ∑ columns.length);  (Row length can not exceed 65536, if it does, varchar can not be used)
	
	
	init(primaryKey: String, autoIncrement: Bool)
	{
		self.primaryKey = primaryKey
		self.autoIncrement = autoIncrement
	}
	
	required public init()
	{
//		self.primaryKey = "id"
		self.autoIncrement = false;
		let mirror = Mirror(reflecting: self)
		for child in mirror.children
		{
			let name:String = child.label!
			let v = Mirror(reflecting: child.value).subjectType
			print("\(name)")
		}
	}
}
