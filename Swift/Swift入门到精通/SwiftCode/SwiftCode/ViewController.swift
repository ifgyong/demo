//
//  ViewController.swift
//  SwiftCode
//
//  Created by fgy on 2019/8/30.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class Person{
	var age = 10
	var name = ""
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
//		let pp = Mirror.init(reflecting: Person.init())
//		for i in pp.children{
//			print(i)
//		}

		typealias FnClo = (Int) -> (Int,Int)
		func getFns() -> (FnClo,FnClo) {
			var num1 = 0
			var num2 = 0
			func plus(_ i:Int) -> (Int,Int){
				num1 += i
				num2 += i << 1
				return (num1,num2)
			}
			func mnus(_ i:Int) -> (Int,Int){
				num1 -= i
				num2 -= i << 1
				return (num1,num2)
			}
			return (plus,mnus)
		}
		
		let (p,m) = getFns()
		print(p(5))
		print(m(4))
		print(p(3))
		print(m(2))
	}


}

