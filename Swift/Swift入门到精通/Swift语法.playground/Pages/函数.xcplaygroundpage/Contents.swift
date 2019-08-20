//: [Previous](@previous)

import Foundation

/// 工作时间
///
/// 更详细的描述
///
/// - Parameter time :工作的时间点
/// - Returns: 我什么时间上班
///
/// - Note: 啥都没有
///

//func goToWork(at time: String){
//	print("now time is "+time)
//}
//goToWork(at:"8:00")
////有标签 调用函数 按照标签赋值，无标签则按照从左向右 依次赋值。
//func check(name:String = "nobody",age:Int = 0,job:String = "none"){
//	print("name=\(name) age=\(age) job=\(job)")
//}
//check(name:"老王",age:19,job:"工人")
//check(name:"老王",age:19)

//可变参数，同一个函数只能有一个可变参数的类型的参数，会产生异议。
//func sum(_ sums:Int...) -> Int{
//	var total = 0
//	for  i  in sums {
//		total += i
//	}
//	return total
//}
//sum(10,10,12)


var outNu = 10,l=10,r=11
func swap(_ a:inout Int,_ b: inout Int){
	let aa = a
	a = b
	b = aa
}
//swap(&l, &r)
//print("l:\(l) r:\(r)")

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



//print("123","456","345",separator:"/")


//函数重载
func f1(a:Int,b:Int,c:Int = 10) -> Void {
	print("a2")
}
func f1(a:Int,b:Int) -> Void {
	print("a1")
}
func f1(a:Double,b:Double) -> Void {
	print("a3")
}
f1(a: 1, b: 1)//调用第2个函数
f1(a: 1.0, b: 1)//调用第二个
f1(a: 1, b: 2,c: 3)//调用第1个



//: [Next](@next)
