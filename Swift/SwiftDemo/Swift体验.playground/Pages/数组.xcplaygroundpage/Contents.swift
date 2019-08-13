//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


//数组可以添加各种类型的 对象的 any
//[Int]存放int类型的
//[String] 存放字符串
//[Any] 存放各种类型的对象
var list = ["张三","李四","王五",4,UIView()] as [Any]
// var 可以追加
// let 不可追加对象
list.append("老王")
print(list[1])
for i in list {
	print(i)
}

//数组扩容问题
//扩容大小从 1->2->4->8->16->32
//可以从开始使用的大小直接声明大小
//let array = [Int](repeating: 0, count: 32);

var newList = [String]()
for i  in 0...16 {
	newList.append(String(i))
	print("容量：\(newList.capacity) 索引：\(i)")
}




