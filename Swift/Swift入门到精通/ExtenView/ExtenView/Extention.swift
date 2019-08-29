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
var kUIViewDirectionType = "UIViewDirectionType"

extension UIView{

	var dir:UIViewDirectionType  {
		set{
			objc_setAssociatedObject(self, kUIViewDirectionType, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
		}
		get{
			return objc_getAssociatedObject(self, kUIViewDirectionType) as! UIViewDirectionType
		}
	}
	func equal(_ v:UIView,_ direction:UIViewDirectionType) -> UIView {
		switch direction {
		case .left:_=self|==v
		case .right:_=self==|v
		case .top:_=self-^=v
		case .bottom:_=self-!=v
	}
		return self
	}
	
//   infix    operator ->;
	func offset(_ direction:UIViewDirectionType,_ offset:Double)  {
		var f1 = self.frame
		
		switch direction {
			case .left:f1.origin.x = f1.minX + CGFloat(offset)
			case .right:f1.size.width = f1.minX + CGFloat(offset)
			case .top:f1.origin.y = f1.minY + CGFloat(offset)
			case .bottom:f1.size.height = f1.size.height + CGFloat(offset)
		}
		self.frame = f1
	}
	func move(_ direction:UIViewDirectionType,_ os:Double) {
		switch direction {
		case .left:self<--os;self--<os
		case .right:self>--os;self-->os
		case .top:self-^>os;self-!>CGFloat(os);
		case .bottom:self-^<CGFloat(os);self-!<CGFloat(os);
		}
		
		
	}


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
infix    operator -^=:AdditionPrecedence;//顶部
infix    operator -^<:AdditionPrecedence;//顶部偏移
infix    operator -^>:AdditionPrecedence;//顶部偏移

infix    operator -!=:AdditionPrecedence;//底部
infix    operator -!<:AdditionPrecedence;//底部偏移
infix    operator -!>:AdditionPrecedence;//底部偏移

//infix    operator <|--:AdditionPrecedence;//左边偏移
infix    operator ==|:AdditionPrecedence;//右边相等
infix    operator |==:AdditionPrecedence;//左边相等
infix    operator <--:AdditionPrecedence;//左边偏移
infix    operator -->:AdditionPrecedence;//右边偏移
infix    operator --<:AdditionPrecedence;//右边左边偏移
infix    operator >--:AdditionPrecedence;//左边向右偏移
enum UIViewDirectionType {
	case top/*顶部*/
	case left/*左*/
	case bottom/*底部*/
	case right/*右*/
	
	

	prefix static func -(_ v:UIViewDirectionType) -> UIViewDirectionType {
		switch v {
		case .left:return .right
		case .right:return .left
		case .top:return .bottom
		case .bottom:return .top
		}
	}
}
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
//func --|> (_ v1:UIView ,_ v2:UIView) ->UIView  {
//    let f1 = v2.frame
//    var f2 = v1.frame
//    f2.origin.x = f1.minX
//    v2.frame = f2
//    return v1
//}
//typealias numberType = Int&Double&Float
//v1等于v2的左边向左移动x像素

func <-- (_ v1:UIView ,_ v2:CGFloat) ->Void  {
    var f1 = v1.frame
    f1.origin.x = f1.minX - CGFloat(v2)
	f1.size.width = f1.size.width + CGFloat(v2)
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
func -^=  (_ v1:UIView ,_ v2:UIView) ->UIView  {
	var f1 = v1.frame
	let f2 = v2.frame
	let distance = f2.maxY - f1.maxY
	let newD = f1.size.height + distance
	
	f1.size.height = newD > 0 ? newD : 0
	v1.frame = f1
	return v1
}
//顶部增加
func -^>  (_ v1:UIView ,_ v2:CGFloat) ->Void  {
	var f1 = v1.frame
	
	let dis = f1.minY + v2
	f1.origin.y = dis
	f1.size.height = f1.size.height - v2
	v1.frame = f1
}
func -^>  (_ v1:UIView ,_ v2:Double) ->Void  {
   v1-^>CGFloat(v2)
}
func -^>  (_ v1:UIView ,_ v2:Int) ->Void  {
	v1-^>CGFloat(v2)
}
//减少
func -^<  (_ v1:UIView ,_ v2:CGFloat) ->Void  {
	var f1 = v1.frame
	f1.origin.y =  f1.origin.y - v2
	f1.size.height = f1.size.height + v2
	v1.frame = f1
}

func -^<  (_ v1:UIView ,_ v2:Double) ->Void  {
	v1-^<CGFloat(v2)
}
func -^<  (_ v1:UIView ,_ v2:Int) ->Void  {
	v1-^<CGFloat(v2)
}
//减少
func -!<  (_ v1:UIView ,_ v2:CGFloat) ->Void  {
	var f1 = v1.frame
	f1.size.height = f1.size.height - v2
	v1.frame = f1
}
func -!<  (_ v1:UIView ,_ v2:Double) ->Void  {
	v1-!<CGFloat(v2)
}
func -!<  (_ v1:UIView ,_ v2:Int) ->Void  {
	v1-!<CGFloat(v2)
}
//减少
func -!>  (_ v1:UIView ,_ v2:CGFloat) ->Void  {
	var f1 = v1.frame
	f1.size.height = f1.size.height + v2
	v1.frame = f1
}
func -!>  (_ v1:UIView ,_ v2:Int) ->Void  {
	v1-!<CGFloat(v2)
}
func -!>  (_ v1:UIView ,_ v2:Double) ->Void  {
	v1-!<CGFloat(v2)
}
//减少
func -!=  (_ v1:UIView ,_ v2:UIView) ->UIView  {
	var f1 = v1.frame
	let f2 = v2.frame
//	f1.origin.y = v2
	f1.size.height = f2.maxY - f1.minY
	v1.frame = f1
	return v1
}



