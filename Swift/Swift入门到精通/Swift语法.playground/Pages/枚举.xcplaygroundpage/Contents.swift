//: [Previous](@previous)

import Foundation




//enum Direction {
//	case north
//	case south
//	case east
//	case west
//}
//let d = Direction.east
//switch d {
//case .east:  print(d.rawValue)
//case .north: print(d)
//case .south: print(d)
//case .west:  print(d)
//}
//
//enum Score {
//	case points(Int)
//	case grade(Character)
//}
//
//enum Date {
//	case digit(yeah:Int,month:Int,day:Int)
//	case string(String)
//}
//var da = Date.digit(yeah: 2019, month: 9, day: 12)
////da = .string("2019-09-19")
//switch da	{
//case .digit(let yeah, let month, let day):
//	print("y:\(yeah) m:\(month) d:\(day)")
//case .string(_):
//	print("str")
//}
//
//
//
//var age = 10
////实际z大小
//let size = MemoryLayout<Int>.size;//MemoryLayout<Int>.size(ofValue: age)
////分配的大小
//let stride = MemoryLayout<Int>.stride //MemoryLayout<Int>.stride(ofValue: age)
////对其参数
//let alignment = MemoryLayout<Int>.alignment //MemoryLayout<Int>.alignment(ofValue: age)
//print("size:\(size) stride:\(stride) alignment:\(alignment)")
//// size:8 stride:8 alignment:8
//
//enum Password {
//	case number(Int,Int,Int,Int)
//	case other
//}
//var pwd = Password.number(1, 2, 9, 0)//字节 8*4 =32
//pwd = .other//同样的变量还是32字节
//let p1 = MemoryLayout.stride(ofValue: pwd)// 40
//let p2 = MemoryLayout.size(ofValue: pwd)//33
//let p3 = MemoryLayout.alignment(ofValue: pwd)//8
//print("\(p1) \(p2) \(p3)")

enum Season : Int{//原始值序号 0 1 2 3
	case spring = 1,sumer = 2, autumn = 3,winter = 4
}
enum Season2 : String{//原始值 0 1 2 3
	case spring = "1",sumer = "2", autumn = "3",winter = "4"
}
var s2 = Season2.spring
var s = Season.spring

MemoryLayout.stride(ofValue: s)
MemoryLayout.size(ofValue: s)
MemoryLayout.alignment(ofValue: s)


//: [Next](@next)
