//
//  ViewController.swift
//  main
//
//  Created by Charlie on 2019/8/28.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		test()
//		print(sum(10, 10))
//		OCFile.run()
//		print(swift_sum(20, 20))
//		let car = Car(p: 2.0, b: "bandstr")
//		car.test()
//		let ocfile = OCFile.init()
//		ocfile.run()
		
		
	
	}
	
	func test()  {
		let f = OCFile.init()
		f.run()
	}
	
	

}
//重命名 c函数
@_silgen_name("sum")
func swift_sum(_ v1:Int32,_ v2:Int32)->Int32

