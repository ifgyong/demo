//
//  FYPerson.swift
//  day01-构造函数
//
//  Created by Charlie on 2019/8/13.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit
//继承父类 NSObject
class FYPerson: NSObject {
	@objc var name:String = ""
	deinit {
		print("\(self.name) is 销毁 class:FYPerson")
	}
}
/**
继承父类 FYPerson
*/
class FYStudent: FYPerson {
	@objc var age:Int = 0
	@objc var level:Int = 0
	/**
	懒加载 当使用的时候进行 闭包的执行
	*/
	lazy var lazyVar:[String] = {
		print("lazy var list")
		return ["老张" ,"老王"]
	}()
	var model:String?{
		didSet{//当更新的时候执行的函数
			if model != nil{
				print("model update \(String(describing: model))")
			}
		}
	}
	/**
	只读属性，不会占用存储空间
*/
	var title :String?  {
		return name+"级别是"+String(level)
	}
	
	
	override init() {
		super.init()
		self.age = 10
		self.level = 3
		self.name = "我是学生"
		}
	/**
	重载构造函数 参数不一样 会调用不一样的函数
	*/
	init(name:String,age:Int,level:Int) {
		super.init()
		self.name = name
		self.age = age
		self.level = level
	}
	/**
	重载构造函数 dict
	*/
	init(dict:[String:Any]) {
		super.init()
		//使用kvc 必须显示 @objc 声明变量
		setValuesForKeys(dict)
	}
	override func value(forUndefinedKey key: String) -> Any? {
		print("key is undefinedkey \(key)")
		return nil
	}
	override func setValue(_ value: Any?, forKey key: String) {
		print("key:\(key) value:\(String(describing: value))")
		super.setValue(value, forKey: key)
	}
	
	convenience init?(age:Int,name:String) {
		if age>100 || age<0 {
			return nil
		}
		self.init(name:name,age:age,level:0)
	}
	
	deinit {
		print("\(self.name) is 销毁 class:FYStudent")
	}
}
