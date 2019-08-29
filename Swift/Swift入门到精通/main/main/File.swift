//
//  File.swift
//  main
//
//  Created by Charlie on 2019/8/28.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation

@objcMembers class Car: NSObject {
	 var price = 0.0
	 var band = "123"
	init(p:Double,b:String) {
		price = p
		band = b
	}
	//dynamic swift 中的类 走oc的runtime的类的流程
	@objc dynamic func test(){
		NSLog("test swift")
	}
	
	
}
