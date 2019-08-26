//
//  main.swift
//  Optional
//
//  Created by Charlie on 2019/8/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation

class test {
//	private class testSub{}
//	fileprivate class testSub2:testSub{}//报错因为testSub有效区域是test函数，testSub2是真个文件。
}

private class testSub{}
// private 和 fileprivate等价
fileprivate class testSub2:testSub{}



//var p = Person()
//p.levelOpen = 2
//p.namePublic = "小红"
//p.showPublic()
//p.openFunc()
//
//struct Point:Equatable{
//	var x = 0,y = 0
//	//中缀加好
//	static func +(p1:Point,p2:Point) -> Point{
//		return Point(x: p1.x+p2.x,y: p1.y+p2.y)
//	}
//	//中缀减法
//	static func -(p1:Point,p2:Point) -> Point{
//		return Point(x: p1.x-p2.x,y: p1.y - p2.y)
//	}
//	//中缀乘法
//	static func *(p1:Point,p2:Int) -> Point{
//		return Point(x: p1.x*p2,y: p1.y*p2)
//	}
//	//h中缀除法
//	static func /(p1:Point,p2:Int) -> Point{
//		if p2 == 0{
//			return p1
//		}
//		return Point(x: p1.x/p2,y: p1.y/p2)
//	}
//	//前缀 减号
//	static prefix func -(p1:Point) -> Point{
//		return Point(x: -p1.x, y: -p1.y)
//	}
//	static postfix func --(p1: inout Point) {
//		p1.x -= 1
//		p1.y -= 1
//	}
//	static postfix func ++(p1: inout Point) {
//		p1.x += 1
//		p1.y += 1
//	}
//	
//	
//	static func == (p1:Point,p2:Point)->Bool{
//		if p1.x == p2.x  && p1.y == p2.y{
//			return true
//		}
//		return false
//	}
//	static func === (p1:Point,p2:Point)->Bool{
//		if p1.x == p2.x  && p1.y == p2.y {
//			return true
//		}
//		return false
//	}
//}
//
//var p1 = Point(x: 10, y: 10)
//var p3 = p1 + p1
//print(p1 == p1)
//print(p1 === p3)



//var v:Int8 = Int8.max &+ 5
//print(v) // -128
//v = Int8.min &- 1
//print(v)//127
//if v < -1 {
//	print(v)
//}
//print(v)



//var age:Int? = 10
//
//age = 20
//age = nil ;
////print(age)
//
//var age1:Optional<Int> = .some(10)
//age1 = .none
//switch age1{
//	// v? 判断是否有值，有值则解包赋值给v
//case let v?:print("1",v)
//case nil:print("nil")
//}
////相当于
//if let v = age1{
//	print(v)
//}else{
//	print("nil2")
//}

