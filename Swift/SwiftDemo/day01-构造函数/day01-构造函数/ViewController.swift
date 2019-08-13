//
//  ViewController.swift
//  day01-构造函数
//
//  Created by Charlie on 2019/8/13.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var s:FYStudent = FYStudent(name: "老王", age: 34, level: 4)
	override func viewDidLoad() {
		super.viewDidLoad()
		test()
//		let array = [String:Any]()["data"]["result"][0]["values"]
	}
	func test(){
//		s = FYStudent(name: "老王", age: 34, level: 4)
//		s = FYStudent(dict: ["name":"老李","age":10,"level":5])
//		s = FYStudent(age: 101, name: "老赵") ?? FYStudent()
//		print("名字：\(s?.name) 年龄：\(s?.age) 级别:\(s?.level)")
		
		s.model = "娃娃哈哈"
	}
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		print(s.lazyVar)
		s.model = nil
//		s.title="1"
		print(s.title ?? "无")
	}


}

