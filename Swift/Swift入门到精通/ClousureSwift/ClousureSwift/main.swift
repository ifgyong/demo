//
//  main.swift
//  ClousureSwift
//
//  Created by Charlie on 2019/8/21.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation

//var fn = {
//	(v:Int) -> Void in
//	print(v)
//}
//
//func test(v1:Int,v2:Int,cl:(_ v:Int,_ v2:Int)->Int) -> Void {
//	print(cl(v1,v2))
//}
//test(v1: 1, v2: 2) {$0+$1}
//test(v1: 2, v2: 2) { (a, b)  in return a+b }
//var array = [2,4,3,2,5,8,7,6,0]
//array.sort { (a, b) -> Bool in
//	return	a>b
//}
//
//print(array)
//typeAlias Fn = (Int) -> Int;
//typealias Clo = (Int) -> Int
//func getFunc () -> Clo {
//    var num = 5 //局部变量 赋值到了堆空间来保证变量的值。每次调用都访问了堆空间了。
//    func plus(_ v:Int) ->Int{
//        num += v
//        return num
//    }
//    return plus
//}
//var f = getFunc()
//print(f(1)) //5+1 = 6
//print(f(2)) //6 + 2 =8
//
//var f2 = getFunc()//每次调用都会调用新的堆空间的 num，他们是分开没联系的。
//print(f2(3))// 5 + 3 = 8

//class CloClass{
//    var num = 6
//    func plus(_ v:Int) -> Int {
//        num += v
//        return num
//    }
//
//}

typealias FnClo = (Int) -> (Int,Int)
func getFns() -> (FnClo,FnClo) {
    var num1 = 0
    var num2 = 0
    func plus(_ i:Int) -> (Int,Int){
        num1 += i
        num2 += i << 1
        return (num1,num2)
    }
    func mnus(_ i:Int) -> (Int,Int){
        num1 -= i
        num2 -= i << 1
        return (num1,num2)
    }
    return (plus,mnus)
}

let (p,m) = getFns()
print(p(5))//5, 5=0b101 << 1 = 0b1010 = 10
print(m(4)) //1=5-1  6
//print(p(3))
//print(m(2))

//m(4)



















