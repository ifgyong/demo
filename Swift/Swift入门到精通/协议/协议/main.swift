//
//  main.swift
//  协议
//
//  Created by Charlie on 2019/8/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation




//var age = 1
//print(Int.self is Int)//判断是否是哪个类



protocol Run {
    
    func test() -> Self
}
class RunSub: Run {
    required init(){//子类必须实现
        
    }
    func test() -> Self {
        let ty = type(of: self)//获取当前类
        return ty.init()
    }
}






protocol TestProtocol {
    var myName : String {get}
    var myLevel : Int{set get}
    var age:Int{set get}
    
     func eat()
     func play()
    static func just()
}
class Person: TestProtocol, CustomStringConvertible,CustomDebugStringConvertible{
    var description: String{
        get{
            return "年龄：\((self.age)),level：\(self.myLevel)"
        }
    }
    
    var debugDescription: String  {
        return "年龄：\((self.age)),level：\(self.myLevel)"
    }
    
    var age: Int = 0
    
    var myName: String {
        get {
        return "年龄：\((self.age)),level：\(self.myLevel)"
        }}
    
    var myLevel: Int = 0
    
    func play() {
        print("play")
    }
    
    func eat() {
        print("eat")
    }
    static func just() {
        print("just")
    }
    func show() {
        print(myName)
    }
    
}
//Person.just()
//var p = Person()
//p.age = 10
//p.myLevel = 3
////p.show()
//print(p)
//p.play()
//p.eat()

//enum PersonEnum : CaseIterable {
//    case man,Wouman,test,test3
//}
//var mans = PersonEnum.allCases
//for  i in mans {
//    print(i)
//}


