//
//  main.swift
//  Subscript
//
//  Created by Charlie on 2019/8/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation

var arr = [1,2,3,4]


var lazyArr = arr.lazy.map { 	(i)->Int in
	print("row:\(i)")
	return i*2
}
print("begin")
print(lazyArr[0])
print(lazyArr[1])
print("end")



var index = arr.firstIndex {$0==2}
var i = index.map{arr[$0]}

print(index,i)







////元素值*2 map：映射
//var arr2 = arr.map { $0 * 2}
////[[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]
//var arr22 = arr.map { Array.init(repeating: $0, count: $0)}//直接添加到arr
////[1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
//var arrNew = arr.flatMap {
//	return Array.init(repeating: $0, count: $0)
//}
//var arrNew2 = arr.flatMap {
//	return Array.init(repeating: $0, count: $0)
//}
////转化失败的不添加到数组中
//var new = arr.compactMap { Int($0)}
//
//print("new:",arrNew)
//
//print(arr,arr22)
////筛选符合条件的
//var arr3 = arr2.filter{$0%2==0}
//print(arr3)
////累计求和
//var ret = arr2.reduce(0) { (ret, el) -> Int in
//	print(ret,el)//ret 是上次返回的值
//	return ret + el
//}
//ret = arr2.reduce(0, {$0+$1})
//print(ret,"====")





//
//struct Point {
//	var x = 0,y = 0
//
//}
//class Pointcls {
//	var p = Point()
//
//	subscript (index index:Int) ->Point{
//		set{
//			print("set")
//			p = newValue
//		}
//		get{print("get"); return p }
//	}
//
//}
//var p = Pointcls()
//p[index: 0] = Point(x: 1, y: 2)
//print(p[index: 0].y)


