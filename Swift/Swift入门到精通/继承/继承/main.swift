//
//  main.swift
//  继承
//
//  Created by Charlie on 2019/8/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation
class Size {
	var width = 0,height = 0
	convenience init(_ w:Int,_ h:Int) {
		self.init(width:w,height:h)
		//code
	}
	convenience init(w:Int) {
		self.init(width:w,height:0)
		//code
	}
	convenience init(h:Int) {
		self.init(width:0,height:h)
		//code
	}

	init(width:Int,height:Int) {
		self.width = width
		self.height = height
	}
	deinit {
		print("Size deinit")
	}
}
class Size2 {
	
}
protocol Size3 {
	func f1()
}
protocol Size4 {
	func f2()
}
protocol Size5:Size3,Size4 {
	
}
class subSize: Size ,Size5{
	func f1() {
		
	}
	func f2() {
		
	}
	//当子类没有初始化器自动继承父类所有的始化器,包含便捷初始化器
	//当初始化器都进行了重写都便捷初始化器自动继承
	//
//	init(_ w:Int,h:Int) {
//		super.init(width: w, height: h)//调用父类指定初始化器
//		self.width = w
//		self.height = h
//	}
	deinit {
		print("subSize deinit")
	}
}

var s:Size = subSize(width: 10, height: 20)
 s = subSize(h: 10)





//class Animal {
//	var age = 0 //8+8 + 8 + 8 = 32
//	func eat()  {
//		print("eat")
//	}
//}
//class Dog: Animal {
//	var height = 0 //8+8 + 8 + 8 = 32
//	override func eat() {
//		print("dog eat")
//	}
//}
//class Cat: Animal {
//	var level = 0 //8+8 + 8 + 8 = 32
//	override func eat() {
//		print("Cat eat")
//	}
//}
////多态
////1.runtime 函数列表
////2.c++ 虚表
//
//var d : Animal
//d = Dog()
////d.age = 8
//d.eat()

//print("\(Mems.ptr(ofRef: d.eat))")
//d =  Cat()
////d.age = 7
//d.eat()
//struct Person{
//	func eat()  {
//		print("eat")
//	}
//}
//var p = Person()
//p.eat()//编译的时候eat地址已经确定，不是动态分发的。



//var dog = Dog()
//dog.height = 7
//dog.age = 2
//dog.eat()
/*
0x0000 指针
0x0008 引用计数
0x0010 属性值 age
0x0018 属性值 height
*/

