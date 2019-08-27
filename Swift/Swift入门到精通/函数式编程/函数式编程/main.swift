//
//  main.swift
//  函数式编程
//
//  Created by fgy on 2019/8/27.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

func hasPrefix(_ pro:String) -> (String)-> Bool {
    return { (str:String ) in
        str.hasPrefix(pro)
    }
}
func hasSuffix(_ pro:String) -> (String)-> Bool {
    return { (str:String ) in
        str.hasPrefix(pro)
    }
}
extension String{
    static func ~=(pattern:(String)->Bool,value:String) -> Bool{
        return pattern(value)
    }
}
var fn = hasPrefix("123")
print(fn("123123"))
var str = "123456"
switch str {
case hasPrefix("1"),hasSuffix("6"):print("1开始，6结束的字符串")
default:
    break
}


//自定义运算符
prefix operator ~=;
prefix operator ~>=;
prefix operator ~<=;
prefix operator ~<;


prefix func ~= (_ v:Int) ->  ((Int)->Bool){return{ $0>v}}
prefix func ~>= (_ v:Int) -> ((Int)->Bool){return{ $0 >= v}}
prefix func ~<= (_ v:Int) -> ((Int)->Bool){return{$0 <= v}}
prefix func ~< (_ v:Int) ->  ((Int)->Bool){return{$0 < v}}
extension Int{
    // MARK: 哈哈
    // TODO: todo
    // FIXME: fix
    static func ~=(pattern:(Int)->Bool,value:Int) -> Bool{
        // MARK: 哈哈
        // TODO: todo
        // FIXME: fix
        return pattern(value)
    }
}
var age = 10
switch age {
case ~>=0:
    print("~>=0")
case ~<=100:
    print("~<=100")
default:
    break
}
class Person {
    // MARK: 哈哈
    // TODO: todo
    // FIXME: fix
}





//print("---")


