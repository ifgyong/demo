//
//  main.swift
//  Access
//
//  Created by Charlie on 2019/8/27.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation
import Dispatch

//class Person {
//	 private(set) var age = 0
//	fileprivate(set) var weight = 100
//}

class Person {
	var age = 10
	init(_ a:Int) {
		age = a
	}
	deinit {
		print("deint")
	}
}

public protocol Runable {
	func run()
}
public class Run: Runable {
	var age = 0
	func test4(_ fn: @escaping ()->()) -> Void {
		DispatchQueue.global().async {
			fn()
			print(self.age)
		}
	}
	
	public func run() {
		print("run")
	}
	deinit {
		print("deint")
	}
}
extension Run{
	func eat() {
		print("eat")
	}
}
//_ = {
//	 var r:Run? = Run.init()
//}()
//	r = nil

//非逃逸闭包
func test (_ fn:()->()){
	fn()
}
//逃逸闭包
func test2 (_ fn:@escaping ()->()) -> ()->(){
	return fn
}
func test3 (fn:@escaping ()->()) -> Void{
	DispatchQueue.global().async {
		fn()
	}
}

//test2 {
//	print("test2")
//}()

//test3 {
//	print("3")
//}
//print("1")
//var step = 1
//var copy = step
//
//func plus(_ n:inout Int)  {
//	 n += step
//}
////报错 不能同时 读和写
//plus(&step)
////ok
//plus(&copy)



//unsafe 不安全
//UnsafePointer // const Pointer *
//UnsafeMutablePointer // Pointer*
//UnsafeRawPointer // const void *
//UnsafeMutableRawPointer // void *
//var age = 10
//func test1 (_ pt:UnsafeMutablePointer<Int>){
//	pt.pointee = 11
//}
//test1(&age)
//print(age)

//var arr = NSArray(objects: 11,22,33,44,55,66,77)
//arr.enumerateObjects { (el, idx, stop) in
//	if idx == 2{
//		stop.pointee = true
//	}
//	print(idx,el)
//}
//print(arr)


////获取指针变量的指针
//var age = 11
//var ptr = withUnsafePointer(to: &age) { ($0)}
////var p3 = withUnsafePointer(to: &age) { (p) -> UnsafePointer<Any> in
////	return p
////}
//var ptr2 = withUnsafeMutablePointer(to: &age) { ($0)}
//print(ptr.pointee)
//print(ptr2.pointee)

//获取指针变量的指针

//var p = Person(10)
//var ptr = withUnsafePointer(to: &p, {UnsafeRawPointer($0)})
//
//print(ptr,ptr)
//print("---")

//创建指针
//var p = malloc(8) //创建指针
//p?.storeBytes(of:12, as: Int.self)//存储数据
//print(p?.load(as: Int.self))//取出来值
//free(p)//释放







//var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
//ptr.storeBytes(of: 13, as: Int.self)
//ptr.storeBytes(of: 12, toByteOffset: 8, as: Int.self)//偏移8字节
//print(ptr.load(as: Int.self))//读取数据
//ptr.deallocate()


//var ptr = UnsafeMutablePointer<Int>.allocate(capacity: 3)
//ptr.initialize(to: 10)
//ptr.successor().initialize(to: 11)//后继  下8字节存储的值
//ptr.successor().successor().initialize(to: 12)
//
//print(ptr.pointee,(ptr+1).pointee,(ptr+2).pointee)
////或
//print(ptr[0],ptr[1],ptr[2])
//
//
////释放内存
//ptr.deinitialize(count: 3)
//ptr.deallocate()


//指向栈空间的指针
//var ptr = UnsafeMutablePointer<Person>.allocate(capacity: 3)
//ptr.initialize(to: Person.init(10))
//ptr.successor().initialize(to: Person.init(11))
//ptr.successor().successor().initialize(to: Person.init(12))
//print(ptr.pointee,(ptr+1).pointee,(ptr+2).pointee)
//
//
//ptr.deinitialize(count: 3)
//ptr.deallocate()


var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
 ptr.assumingMemoryBound(to: Int.self).pointee = 11
(ptr+8).assumingMemoryBound(to: Int.self).pointee = 12//后移8位





