//
//  main.swift
//  ClousureSwift
//
//  Created by Charlie on 2019/8/21.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation


//class Person {
//	var age = 9
//}
//typealias Clo = (Int) -> Int
//func getFunc () -> Clo {
//	//    var num = 5 //局部变量 赋值到了堆空间来保证变量的值。每次调用都访问了堆空间了。
//	//作业 person = Person() 观察 一个或者两个person
//	var p = Person()
//
//	func plus(_ v:Int) ->Int{
//		//        num += v// 申请8+8+8 =24字节在堆空间
//		p.age += v;
//		return p.age
//	}
//	print("return plus begin")
//	return plus
//}
//var f = getFunc() //
//print(f(3))
//
//print("person func end")


//func getFirstPositive2(_ v:Int,_ v2 : () -> Int) ->Int{
//	return v > 0 ? v: v2()
//}
////自动闭包延迟执行闭包代码
//func getFirstPositive(_ v:Int,_ v2 : @autoclosure () -> Int) ->Int{
//	return v > 0 ? v: v2()
//}
////let a = getFIrstPositive(1,{2})
//let a = getFirstPositive(0, 2)
//
//print(a)



////print(MemoryLayout.stride(ofValue: f))//16
//f(6) //5+1 = 6 调用f的前8个字节
//print(f(2)) //6 + 2 =8


//func sum(_ v1:Int,_ v2:Int) -> Int{return v2 + v1 }
//var s1 = sum
//print(s1(1,2))

//
//var f2 = getFunc()//每次调用都会调用新的堆空间的 num，他们是分开没联系的。
//print(f2(3))// 5 + 3 = 8

//class CloClass{
//    var num = 6
//    func plus(_ v:Int) -> Int {
//        num += v
//        return num
//    }
//
//}



func cloTest1()  {
	typealias FnClo = (Int) -> (Int,Int)
	func getFns() -> (FnClo,FnClo) {
	    var num1 = 1
	    var num2 = 2
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
		//在return的时候分配堆空间存放num1和num2。
	    return (plus,mnus)
	}
	
	let (p,m) = getFns()
	p(5)//(5,10) 5 = 0b101 << 1 = 0b1010 = 10
	m(4) //(1,6) = 5-1  6
	p(3)//(4, 8)
	m(2)//(2, 4)
}
cloTest1()
//m(4)



















