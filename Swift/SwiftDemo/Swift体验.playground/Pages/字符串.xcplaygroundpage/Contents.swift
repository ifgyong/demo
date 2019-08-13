//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

print(str)

let age = 10
let hello:String = "你好啊"+String(age)
print(hello)
//直接\()就可以读取int 类型的值
print("我是年龄是\(age)")

let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
print(frame)

//时间格式化
let h = 10
let m = 11
let s = 5

 str = String(format: "%02d:%02d:%02d", arguments: [h,m,s])
print(str)

//将str 转化成NSSting 来处理字符串
extension String{
	public func subString(_ rang:NSRange) -> String{
		let str = self as NSString
		return  str .substring(with: rang) as String;
	}
}

let all = "我是乔碧萝殿下"
print(all.subString(NSMakeRange(0, 3)))






















