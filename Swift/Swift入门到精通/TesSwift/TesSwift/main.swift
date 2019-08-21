//
//  main.swift
//  TesSwift
//
//  Created by Charlie on 2019/8/20.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation


//var n = 10
//func test (_ num: inout  Int) -> Void{
////    num = 11
////    return num
//}
//n是结构体 有地址 test(&10),10是int，不是结构体Int，则不能传递。
//能多次赋值的可以传递进去。

//test(&n)
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
//func test1() -> Void {
//    print("test")
//}
////未优化
//func test2() -> Void {
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//    print("test")
//}
//test2()
//优化之后是 print("test")
/*
   0x100000e76 <+150>: callq  0x100000f44               ; symbol stub for: Swift.print(_: Any..., separator: Swift.String, terminator: Swift.String) -> ()
*/
//

//动态派发 不会优化
//class Person{
//    func test()  {
//
//    }
//}
//class Student: Person {
//    override func test()  {
//
//    }
//}
//
////永远不会内联(即使编译器开了优化)
//@inline(never) func  add() -> Void {
//
//}
//
////开启编译器o优化，几十代码很长，也会内联（递归和动态派发除外）
//@inline(__always) func  add(a:Int8 = 0) -> Void {
//
//}
//func add(a l:Int8 = 0,r b:Int8 = 10,s c:Int8) -> Void {
//    print("a:\(l) b:\(b) c:\(c)")
//}
//
//
//add(s:1)







//var age = 10
////实际z大小
//let size = MemoryLayout<Int>.size;//MemoryLayout<Int>.size(ofValue: age)
////分配的大小
//let stride = MemoryLayout<Int>.stride //MemoryLayout<Int>.stride(ofValue: age)
////对其参数
//let alignment = MemoryLayout<Int>.alignment //MemoryLayout<Int>.alignment(ofValue: age)
//print("size:\(size) stride:\(stride) alignment:\(alignment)")

// size:8 stride:8 alignment:8

//enum Password {
//	case number(Int,Int,Int,Int)
//	case other
//}
//enum TestEnum {
//	case test1,test2,test3,test4
//}
//var testum = TestEnum.test1
//var p1 = MemoryLayout.stride(ofValue: testum)
//var p2 = MemoryLayout.size(ofValue: testum)
//var p3 = MemoryLayout.alignment(ofValue: testum)
//print("分配：\(p1)  占用：\(p2) 对齐：\(p3)")

// rip存储 下句CPU的下一条指令地址
//  movq   $0x1, 0x5d21(%rip) 内存地址：0x0000000100001acf+0x5d1e
//  movq   $0x2, 0x5d1e(%rip) 内存地址：
//  movq   $0x7, 0x5d1b(%rip) 内存地址：0x0000000100001ae5+0x5d1b=0x100007800
//  movq   $0x8, 0x5d18(%rip) 内存地址：
//  movb   $0x0, 0x5d19(%rip) 内存地址：
//  leaq   0x5cf2(%rip), %rdi
//var pwd = Password.number(3, 5, 7, 8)//字节 8*4 =32
//var otherPwd = 123
//
//pwd = .other//同样的变量还是32字节
// p1 = MemoryLayout.stride(ofValue: pwd)// 40
// p2 = MemoryLayout.size(ofValue: pwd)//33
// p3 = MemoryLayout.alignment(ofValue: pwd)//8
//print("分配：\(p1)  占用：\(p2) 对齐：\(p3)")
//print(Mems.ptr(ofRef: pwd))
//func test(){
//	var a = 9
//	var b = a + 2
//
//
//}
//test()

/*
let pwd5 = Password.number2(4, 5,6)
0x100006530: 0x00000004 0x00000000 0x00000005 0x00000000
0x100006540: 0x00000006 0x00000000 0x00000020 0x00000000

let pwd5 = Password.number3(4, 5)//同样的变量还是33字节
0x100006530: 0x00000004 0x00000000 0x00000005 0x00000000
0x100006540: 0x00000000 0x00000000 0x00000040



*/
func testeStruct(){
	
	struct Point {
		var x:Int = 0
		var y:Int = 0
//		var b = true
		
		//	init(x:Int) {
		//		self.x = x
		//	}
		func copy(with zone: NSZone? = nil) -> Any {
			return self
		}
		
	}
//	var point1 = Point()
//	print(MemoryLayout<Point>.size(ofValue: point1))
//	print(point1)
	
	
	class PointClass {
		var x:Int = 0
		var y:Int = 0
		
		
	}
//	var p11 = Point(x: 6, y: 7)
//	p11 = Point(x: 8, y: 9)
//	var p22 = p11
//	print("p11:",Mems.ptr(ofVal: &p11))
//	print("p22:",Mems.ptr(ofVal: &p22))

//	 movq   %rax, -0x10(%rbp) //rbp-0x10  相差8字节 就是int的空间
//	 movq   %rdx, -0x8(%rbp) //rbp-0x8
//	 movq   %rax, -0x20(%rbp)//rbp-0x20
//	 movq   %rdx, -0x18(%rbp)//rbp-0x18

	
	
	var s :String = "haha"
	var s2 = s
	print(Mems.ptr(ofVal: &s2),Mems.ptr(ofVal: &s))
	s2.append("来了")
	print(Mems.ptr(ofVal: &s2),Mems.ptr(ofVal: &s))

	var set1 = Set(arrayLiteral: 1)
	var set2 = set1
	
	print(Mems.ptr(ofVal: &set2),Mems.ptr(ofVal: &set1))

	
	var dic1 = Dictionary(dictionaryLiteral: ("key","value"))
	var dic2 = dic1
	
	print(Mems.ptr(ofVal: &dic2),Mems.ptr(ofVal: &dic1))

	
	
	
	
}



testeStruct()

//// size:8 stride:8 alignment:8
//
//enum Password {
//    case number(Int,Int,Int,Int)
//    case other
//}
//var pwd = Password.number(1, 2, 9, 0)//字节 8*4 =32
//pwd = .other//同样的变量还是32字节
//let p1 = MemoryLayout.stride(ofValue: pwd)// 40
//let p2 = MemoryLayout.size(ofValue: pwd)//33
//let p3 = MemoryLayout.alignment(ofValue: pwd)//8
//print("\(p1) \(p2) \(p3)")


//var num1 :Int? = nil
//var num2:Int?? = num1
//var num3:Int?? = nil
//print(num2 ?? 1 ?? 0 ?? 0 )
//(num2 ?? 1 ) ?? 2//2
//(num3 ?? 1) ?? 2//1
