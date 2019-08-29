//
//  main.swift
//  函数式变成
//
//  Created by Charlie on 2019/8/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation
//protocol arrayType {
//
//}
//extension Array:arrayType{}
//extension NSArray:arrayType{}
////extension NSMutableArray:arrayType{}
//
//
//func isArrayType(_ type: Any.Type) -> Bool {
//    print(type)
//    return type is [Any].Type
//}
//print(isArrayType([Int].self))
//print(isArrayType([Double].self))
//print(isArrayType([CGFont].self))





//func isArray(_ value:Any) -> Bool {
//    return value is [Any]
//}
//print(isArray( NSArray()))//trye
//print(isArray( NSMutableArray()))//true
//print(isArray([1]))//true
//print(isArray(NSSet()))//false




struct FY<Base> {
	var base:Base
	
	init(_ base:Base) {
		self.base = base
	}
}
protocol FYCompatiabale {
    
}
extension FYCompatiabale{
    var fy :FY<Self>{
        set{
            
        }
        get{
              return  FY(self)
        }
    }
}
extension FY where Base:ExpressibleByStringLiteral{
    func number() -> Int {
        let s = base as! String
        var count = 0
        
        for i in s where ("0"..."9").contains(i){
            count += 1
        }
        return count
    }
}


extension String{
	var fy:FY<String>{return FY<String>(self)}
}
//var ss = "111"
//ss.fy.number()

print("1234".fy.number())

var num = 1
func add(_ v1:Int,_ v2:Int)->Int{
	return v1+v2
}
func add(_ v1:Int) -> (_ v:Int)->Int{
	return {$0 + v1}
}
//kelihua
func add(_ v:Int)-> (Int)->((Int)->Int){
	//v30
	return{
		a in//20
		return { b in//10
			return b - a + v
		}
	}
}
let ret = add(5)(3)(10)//10 - 3 + 5
print(ret)


func currying <A,B,C>(_ fn:@escaping (A,B)->C)->(B)->((A)->C){
	return { v1 in
		return {
			v2 in
			return fn(v2,v1)
		}
	}
}
//克里化
prefix func ~<A,B,C,D>(_ fn:@escaping (A,B,C)->D) ->(C)->(B)->(A)->D{
	return { c in {b in {a in fn(a,b,c)}}}
}
//let ret2 = currying(add)(10)(20)(30)
//print(ret2)
//函子 Functor
extension Array{
	mutating func map2<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
		for (i,item) in self.enumerated(){
			let el = try? transform(item)
			if let el2 = el{
				self[i] = el2 as! Element
			}
		}
		return self as! [T]
	}
}
var arr = [1,2,3,4]
let ar = arr.map2 { (i) -> Int in
	return i*2
}
print(ar)






