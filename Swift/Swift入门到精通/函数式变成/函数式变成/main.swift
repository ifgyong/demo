//
//  main.swift
//  函数式变成
//
//  Created by Charlie on 2019/8/29.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation
struct FY<Base:Sequence> {
	var str:Base?
	
	init(_ str:Base) {
		self.str = str
	}
	var numberCount:Int
	{
		var count = 0
		if let ss = str {
			for c in ss  where ("0"..."9").contains(String(c)){
				count += 1
			}
			return count
		}
		return 0
		
	}
	
}

extension String{
	var fy:FY<String>{return FY<String>(self)}
}

print("12".fy.numberCount)

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





