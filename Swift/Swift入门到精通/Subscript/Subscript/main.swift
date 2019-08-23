//
//  main.swift
//  Subscript
//
//  Created by Charlie on 2019/8/23.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation

struct Point {
	var x = 0,y = 0
	
}
class Pointcls {
	var p = Point()
	
	subscript (index index:Int) ->Point{
		set{
			print("set")
			p = newValue
		}
		get{print("get"); return p }
	}
	
}
var p = Pointcls()
p[index: 0] = Point(x: 1, y: 2)
print(p[index: 0].y)


