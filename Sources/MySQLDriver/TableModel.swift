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
			_ = Mirror(reflecting: child.value).subjectType
			print("\(name)")
		}
	}
}
