//
//  ViewController2.swift
//  day01-构造函数
//
//  Created by Charlie on 2019/8/13.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
	deinit {
		print("ViewController2 is deinit")
	}
	var name: String = "老王"
	
	typealias pop = (_ msg: String)->()
	var popB:pop = {(msg: String)-> Void in
		print(msg+"闭包执行了")
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		//弱引用
		weak var weakSelf = self
//		[weak self] 内部不对self进行强引用
		//[unowned self] 不会对self置为nil
		self.popB = {[unowned self]
			(msg: String) -> Void in
			print("haha 闭包执行了" + msg)
			print(self.name ?? "默认名字")
		}
		let queue = DispatchQueue.global()
		
		queue.async {
			sleep(2)
			
			DispatchQueue.main.async {
				weakSelf?.popB("回到主线程");
			}
		}
		
//		popB("哈哈")
    }
    
	

}
