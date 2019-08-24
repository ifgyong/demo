//
//  main.swift
//  Error
//
//  Created by fgy on 2019/8/24.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation



class Stack<T> {
    var size = 0
    
    private var elements = [T]()
    func append(_ em:T)  {
        elements.append(em)
        size += 1
    }
    func pop() -> T {
        size -= 1
        return elements.removeLast()
    }
    func sizeStack() -> Int {
        return size > 0 ? size : 0
    }
}
//使用int类型的栈
//
var ss = Stack<Int>()
ss.append(2)
//ss.append("3str")
//ss.pop()
print(ss)







//var a = 10,b = 20
//func swapValue<T>(_ a:inout T,_ b:inout T){
////    let hah = a
////    a=b
////    b=hah
//    (a,b) = (b,a)
//}
//var str1 = 1.0
//var str2 = 2.0
//swapValue(&str1, &str2)
//print(str1,str2)
//讲函数赋值变量
//var fn:(inout Int,inout Int) -> () = swapValue






//enum ErrorT:Error {
//    case msg(msg:String)
//    case outofBound(low:Int,Hight:Int)
//    case otherError
//}
//func test (l:Int,r:Int) throws -> Int{
//    if r != 0{
//        return l/r
//    }else{
//        throw ErrorT.msg(msg: "不能为0")
//    }
//}
//do {
//    let a = try test(l: 0, r: 0)
//    print(a)
//}catch let ErrorT.msg(msg){
//    print(msg)
//}catch ErrorT.otherError{
//    print("other error")
//}catch let ErrorT.outofBound(low, Hight)
//{
//    print(low,Hight)
//}

