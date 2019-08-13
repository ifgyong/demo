//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//闭包
let demo = {
	print("123")
}
//执行闭包
demo()

// in 区分 函数和闭包
let demo2 = {
	(_ a : Int , _ b : Int) -> Int in
	return a + b
}
//打印出来闭包执行的结果

print( demo2(1,2))


