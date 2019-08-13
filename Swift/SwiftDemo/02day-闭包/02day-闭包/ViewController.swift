//
//  ViewController.swift
//  02day-闭包
//
//  Created by Charlie on 2019/8/13.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
typealias complateBlock = ()-> Void
	var complate :complateBlock?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		addView(numsOfItems: { () -> Int in
			return 3
		}) { (index:Int) -> UILabel in
			let label = UILabel(frame: CGRect(x: 50*index, y: 0, width: 50, height: 50))
			label.text = "标签\(index)"
			label.textColor = UIColor.black
			label.font = UIFont.systemFont(ofSize: 13)
			label.backgroundColor = UIColor.red
			return label
		}
	}
	func addView(numsOfItems:()->Int,labelIndex:(Int) -> UILabel) -> Void {
		let scr = UIScrollView.init(frame: CGRect(x: 0, y: 100, width: 300, height: 100))
		let count = numsOfItems()
		for i in 0...count {
			let label = labelIndex(i)
			scr.addSubview(label)
			print(i)
		}
		
		self.view.addSubview(scr)
		
		
		
		
		
		
	}
	func loadData(finish:@escaping (_ msgString: String)-> Void) -> Void {
		let queue = DispatchQueue.main
		let other = DispatchQueue.init(label: "测试队列")
		other.async {
			print("异步")
			queue.async {
				finish("执行完了 主线程")
			}
		}
		
		queue.async {
			print("queue-异步")
			
		}
		
	}

}

