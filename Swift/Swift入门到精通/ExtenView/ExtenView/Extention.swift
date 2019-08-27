//
//  Extention.swift
//  ExtenView
//
//  Created by fgy on 2019/8/27.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit
class Person {

}

extension UIView{

    
//   infix    operator ->;
    

}
//precedencegroup eqView{
//    associativity:none
//    higherThan:AdditionPrecedence
//    lowerThan:MultiplicationPrecedence
//    assignment:true
//}
//precedencegroup offsetView{
//    associativity:none
//    higherThan:AdditionPrecedence
//    lowerThan:MultiplicationPrecedence
//    assignment:true
//}
infix    operator --|>:AdditionPrecedence;//右边偏移
infix    operator <|--:AdditionPrecedence;//左边偏移
infix    operator ==|:MultiplicationPrecedence;//右边相等
infix    operator |==:MultiplicationPrecedence;//左边相等
infix    operator <--:AdditionPrecedence;//左边偏移
infix    operator -->:AdditionPrecedence;//右边偏移
infix    operator --<:AdditionPrecedence;//右边左边偏移
infix    operator >--:AdditionPrecedence;//左边向右偏移
func ==| (_ v1:UIView ,_ v2:UIView) ->UIView  {
    var f1 = v1.frame
    
    let f2 = v2.frame
    let distance = f2.maxX - f1.maxX
    let newD = f1.size.width + distance
    
    f1.size.width = newD > 0 ? newD : 0
    v1.frame = f1
    return v1
}
func |== (_ v1:UIView ,_ v2:UIView) ->UIView  {
    var f1 = v1.frame
    let f2 = v2.frame
    let dis = f1.minX - f2.minX//宽度多dis距离
    
    f1.origin.x = f2.minX
    f1.size.width = f1.size.width + dis
    v1.frame = f1
    return v1
}
func --|> (_ v1:UIView ,_ v2:UIView) ->UIView  {
    let f1 = v2.frame
    var f2 = v1.frame
    f2.origin.x = f1.minX
    v2.frame = f2
    return v1
}
//typealias numberType = Int&Double&Float
//v1等于v2的左边向左移动x像素
func <-- (_ v1:UIView ,_ v2:CGFloat) ->Void  {
    var f1 = v1.frame
    f1.origin.x = f1.minX - CGFloat(v2)
    v1.frame = f1
}
func <-- (_ v1:UIView ,_ v2:Double) ->Void  {
   v1<--CGFloat(v2)
}
func <-- (_ v1:UIView ,_ v2:Int) ->Void  {
    v1<--CGFloat(v2)
}
func --> (_ v1:UIView ,_ v2:CGFloat) ->Void  {
    var f1 = v1.frame
    f1.size.width = f1.size.width + CGFloat(v2)
    v1.frame = f1
}
func --> (_ v1:UIView ,_ v2:Int) ->Void  {
   v1-->CGFloat(v2)
}
func --> (_ v1:UIView ,_ v2:Double) ->Void  {
    v1-->CGFloat(v2)
}

func --< (_ v1:UIView ,_ v2:CGFloat) ->Void  {
    var f1 = v1.frame
    f1.size.width = f1.size.width - CGFloat(v2)
    v1.frame = f1
}
func --< (_ v1:UIView ,_ v2:Double) ->Void  {
    v1--<CGFloat(v2)
}
func --< (_ v1:UIView ,_ v2:Int) ->Void  {
    v1--<CGFloat(v2)
}
func >-- (_ v1:UIView ,_ v2:CGFloat) ->Void  {
    var f1 = v1.frame
    f1.origin.x = f1.origin.x + CGFloat(v2)
    f1.size.width =  f1.size.width-CGFloat(v2)
    v1.frame = f1
}
func >-- (_ v1:UIView ,_ v2:Double) ->Void  {
    v1>--CGFloat(v2)
}
func >-- (_ v1:UIView ,_ v2:Int) ->Void  {
    v1>--CGFloat(v2)
}







