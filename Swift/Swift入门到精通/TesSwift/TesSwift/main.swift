//
//  main.swift
//  TesSwift
//
//  Created by Charlie on 2019/8/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation


var n = 10
func test (_ num: inout  Int) -> Void{
//	num = 11
//	return num
}
//n是结构体 有地址 test(&10),10是int，不是结构体Int，则不能传递。
//能多次赋值的可以传递进去。

test(&n)
/*
inout 地址传递 可以多次赋值
lea: 地址传递
(%rdi)  寻找rdi 地址的值
test(&n)
0x100000f39 <+57>: leaq   0x120(%rip), %rdi         ; TesSwift.n : Swift.Int
0x100000f40 <+64>: callq  0x100000f60               ; TesSwift.test(inout Swift.Int) -> () at main.swift:13

test(n)
0x100000f50 <+80>: movq   -0x30(%rbp), %rdi
0x100000f54 <+84>: callq  0x100000f70               ; TesSwift.test(Swift.Int) -> () at main.swift:13
*/
//print("\(test(&n))")

//有些优化成 内联函数，函数体较长则不用优化
func test1() -> Void {
	print("test")
}
//未优化
func test2() -> Void {
	print("test")
	print("test")
	print("test")
	print("test")
	print("test")
	print("test")
	print("test")
	print("test")
	print("test")
	print("test")
}
//test2()
//优化之后是 print("test")
/*
   0x100000e76 <+150>: callq  0x100000f44               ; symbol stub for: Swift.print(_: Any..., separator: Swift.String, terminator: Swift.String) -> ()
*/
//

//动态派发 不会优化
class Person{
	func test()  {
		
	}
}
class Student: Person {
	override func test()  {
		
	}
}

//永远不会内联(即使编译器开了优化)
@inline(never) func  add() -> Void {
	
}

//开启编译器o优化，几十代码很长，也会内联（递归和动态派发除外）
@inline(__always) func  add(a:Int8 = 0) -> Void {
	
}
func add(a l:Int8 = 0,r b:Int8 = 10,s c:Int8) -> Void {
	print("a:\(l) b:\(b) c:\(c)")
}
//
//
//add(s:1)







var age = 10
//实际z大小
let size = MemoryLayout<Int>.size;//MemoryLayout<Int>.size(ofValue: age)
//分配的大小
let stride = MemoryLayout<Int>.stride //MemoryLayout<Int>.stride(ofValue: age)
//对其参数
let alignment = MemoryLayout<Int>.alignment //MemoryLayout<Int>.alignment(ofValue: age)
print("size:\(size) stride:\(stride) alignment:\(alignment)")
// size:8 stride:8 alignment:8

enum Password {
	case number(Int,Int,Int,Int)
	case other
}
var pwd = Password.number(1, 2, 9, 0)//字节 8*4 =32
pwd = .other//同样的变量还是32字节
let p1 = MemoryLayout.stride(ofValue: pwd)// 40
let p2 = MemoryLayout.size(ofValue: pwd)//33
let p3 = MemoryLayout.alignment(ofValue: pwd)//8
print("\(p1) \(p2) \(p3)")


