//
//  main.swift
//  属性
//
//  Created by Charlie on 2019/8/22.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation

struct Point {
	var x = 0.0,y = 0.0
	//discardableResult 消除警告
	@discardableResult mutating func moveBy(_ v:Double) -> Double {
		x += v
		return x
	}
}


class Pointcls {
	var x = 0.0,y = 0.0
	func move(_ v:Double)  {
		x += v
	}
}

var p = Point(x: 1, y: 1.0)
p.moveBy(2.0)


//
//class Point {
//    var x = 0
//    var y = 0
//}
//
////存储case 和 关联值
//
//enum Season:Int {
//    case spring=2,summer=5
//}
////var s = Season.spring
//
//struct Circle {  //占用空间是8字节
//    //存储属性
//    var radius : Double
//    //计算属性 本质是方法
//    var diamter : Double {
//        set{
//            radius = newValue/2
//        }
//        get{
//            return radius * 2
//        }
//
//    }
//
//
//}
//var cir = Circle(radius: 4)
////print(cir.diamter)
//cir.radius = 8
//cir.diamter = 9
//var f = cir.diamter

//print(cir.diamter)




//struct Photo {
//
//    var age:Int {
////        get{
////            return height/2
////        }
////        set{
////            height =  newValue * 2
////        }
//        willSet{
//            print("will\(newValue)")
//        }
//        didSet{
//            print("didset old:\(oldValue)")
//        }
//    }
////    var height = 12
//}
//var p = Photo(age: 5)
//
//func test(_ v: inout Int) {
//    v = 9
//}
//test(&p.age)


//class fileManger {
//    public static let  manger:fileManger = fileManger()
//    private init(){//设置私有，外部不可访问
//        print("init")
//    }
//    open func close()  {
//        print("close")
//    }
//    public  func open()  { //mode 可访问
//        print("open")
//    }
//}
//var file = fileManger.manger

//file.init()//error：init' is inaccessible due to 'private' protection level
//
//
//struct Propty {
//    var age = 10
//    static var level = 11
//
//}
//var pro = Propty()
//pro.age = 11;
//var level = Propty.level;
//
//
//
