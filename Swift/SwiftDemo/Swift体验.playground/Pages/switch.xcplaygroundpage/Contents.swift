//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//条件可以是字符串
//OC只有数字且需要break，
//Swift则不需要break
let tag:String = "老王"
switch tag {
case "老王":
	print(tag)
case "老李":
	print("我来了\(tag)");
case "老张":
	print("我来了\(tag)");
default:
	print("我来了\(tag)");
}

