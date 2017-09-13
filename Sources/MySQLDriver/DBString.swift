//
//  DB2String.swift
//  MySQLDriver
//
//  Created by Robert Schmid  on 9/13/17.
//
//

import Foundation

public class DBString: ExpressibleByStringLiteral, CustomStringConvertible
{
	var value: String
	var maxLength: Int?
	
	static let TINY:Int = 255 //2^8 - 1
	static let REGULAR:Int = 65535 //2^16 - 1
	static let MEDIUM:Int = 16777215 //2^24 - 1
	static let LONG:Int = 4294967295 //2^32 - 1

	public var description: String
	{
		if let max = self.maxLength
		{
			let mIdx = self.value.index(self.value.startIndex, offsetBy: max)
			return self.value.substring(to: mIdx)
		}
		return self.value
	}
	
	public required init(stringLiteral value: String)
	{
		self.value = value
	}

	required public init(extendedGraphemeClusterLiteral value: String)
	{
		self.value = value
	}
	
	required public init(unicodeScalarLiteral value: String)
	{
		self.value = value
	}
	
	public static func columnDescription(_ val: String?) -> String
	{
		var type = "MEDIUMTEXT"
		if let v = val, let maxLength = v.maxLength
		{
			switch maxLength
			{
				case DBString.TINY:
					type = "TINYTEXT"
					break
				case DBString.REGULAR:
					type = "TEXT"
					break
				case DBString.MEDIUM:
					type = "MEDIUMTEXT"
					break
				case DBString.LONG:
					type = "LONGTEXT"
					break
				default:
					if maxLength < DBString.REGULAR
					{
						type = "VARCHAR(\(maxLength))"
					}
			}
		}
		
		return type
	}
}

public class TinyText: DBString
{
	override var maxLength: Int?
	{
		get {
			return DBString.TINY
		}
		set {
			fatalError("Can not set string length on TinyText. It is fixed at 2^8-1")
		}
	}
}

public class Text: DBString
{
	override var maxLength: Int?
		{
		get {
			return DBString.REGULAR
		}
		set {
			fatalError("Can not set string length on Text. It is fixed at 22^16-1")
		}
	}
}

public class MediumText: DBString
{
	override var maxLength: Int?
		{
		get {
			return DBString.MEDIUM
		}
		set {
			fatalError("Can not set string length on MediumText. It is fixed at 22^24-1")
		}
	}
}

public class LongText: DBString
{
	override var maxLength: Int?
		{
		get {
			return DBString.LONG
		}
		set {
			fatalError("Can not set string length on LongText. It is fixed at 22^32-1")
		}
	}
}

public class VarChar: DBString
{
	public convenience init(value:String, maxLength: Int)
	{
		self.init(stringLiteral: value)
		self.maxLength = maxLength
	}
	
	public required init(stringLiteral value: String) {
		super.init(stringLiteral: value)
	}
	
	required public init(extendedGraphemeClusterLiteral value: String) {
		super.init(stringLiteral: value)
	}
	
	required public init(unicodeScalarLiteral value: String) {
		fatalError("init(unicodeScalarLiteral:) has not been implemented")
	}
}
