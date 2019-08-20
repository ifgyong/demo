//: [Previous](@previous)

import Foundation


var age:Int?//nil
age = 10
age!


//var array = [1,14,15,40]
//func get(_ index:Int) ->Int?{
//    if index < 0 || index >= array.count {
//        return nil
//    }
//    return array[index]
//}
//get(14)//nil
//get(1)//optional(14)
//get(-1)//nil

//var num = Int("123")
//print(num)
//
//if let n = num {
//    print(n)
//}

//enum Season:Int{
//    case spring = 1,summer,autum,winter
//}
//var s = Season(rawValue:2)
////print(s)
//
//if let a = Int("13"),let b = Int("12"),a < 100 && b > 10 {
//    print(a,b)
//}
//var strs = ["1","2","12","34","0"]


//let a:Int? = 1
//let b:Int? = 2
//let c = a ?? b //c = 1
//
//let a:Int? = nil
//let b:Int? = 2
//let c = a ?? b //c = 2
//
//let a:Int? = nil
//let b:Int? = nil
//let c = a ?? b  ?? 3//c = 3

//var array = [1,2,3]
//var i = array[3]
//print(i)
//var age1 = 10
//func test() ->Void{
//    guard age1 > 100 && age1 < 0 else {
//        print("age is 0-100")
//        return
//    }
//}
//test()

/*
 在某些情况，**可选项一旦被设定值之后，就会一直拥有值**,当这种情况下，可以去掉检查，不必每次访问的时候都进行解包，因为它能确定每次访问的时候都有值，可以再在类型后面添加！定义一个隐式解包的可选项
 */
//let num1:Int! = 10
//let num2:Int = num1


//var myage:Int? = 10
//print(myage)// Optional(10)
//print("age is \(myage)") // Optional(10)
//print("age is \(myage ?? 0)") // 10




//var num1 :Int? = 10
//var num2:Int?? = num1
//var num3:Int?? = 10


var num1 :Int? = nil
var num2:Int?? = num1
var num3:Int?? = nil
print(num2 ?? 1 )
(num2 ?? 1 ) ?? 2//2
(num3 ?? 1) ?? 2//1




//: [Next](@next)
