//
//  Person.swift
//  testSwift
//
//  Created by Charlie on 2019/8/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation
open class Person{
	fileprivate var ageFileprivate = 0
	public var namePublic = "小明"
	open var levelOpen = 1
	private var illPrivate = "ill"
	public func showPublic()  {
		print("我叫\(namePublic),年龄\(ageFileprivate),级别\(levelOpen),爱好\(illPrivate)")
	}
	open func openFunc(){}
	internal func funcInternal(){}
	fileprivate func funcfileprivate(){}
	private func funcprivate(){}

	public  init() {
		
	}
}
