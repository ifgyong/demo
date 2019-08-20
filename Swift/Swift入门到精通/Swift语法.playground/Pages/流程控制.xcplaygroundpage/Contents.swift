//: [Previous](@previous)

import Foundation

var a = 10
var b = 11
var c = a + b


func next(_ input:Int) -> Int{
	return	input + 1
}

func next2(_ input:Int) -> Int{
	return	input * 2
}
//高阶函数 返回一个函数闭包
func nextF(_ f:Bool) -> (Int) -> Int{
	if f {
		return next
	}else{
		return next2
	}
}
print(nextF(false)(10))


let l = 0
let r = 2
for i in l...r {
	print(i)
}
let names = ["老王","老李","老张","老赵"]
//for i in names { print(i) }
for i in names[0...2] { print(i) }
print("---")
for i in names[0...] { print(i) }
print("---")
for i in names[...1] { print(i) }

let rang:ClosedRange = 0...3
let rang1:Range<Int> = 0..<3
let rang2:PartialRangeThrough<Int> = ...3 //0到无穷大

for i in rang {
	print(i)
}









let cS = "a" //默认String
let sS = "a"//默认String
let ch : Character = "a" //显示声明字符 结构体为Character

print(cS.contains("a"))

let caseN = 1//不用写break 没有贯穿效果，
switch caseN {
case 0:
	print("0")
//	fallthrough 想要贯穿效果 添加此行
default:
	print("default")
}

enum Answer {
	case right,wrong
}
let ans = Answer.right//保证所有条件均考虑到不用写default
switch ans {
case .right:print("right")
case .wrong:print("wrong")
}



let age = 4
switch age {
case 0...3:print("婴儿")
case 4...10:print("青少年")
case 11...100:print("成年人")
default:
	print("不是人")
}

let p = (1,1)
switch p {
case (_,1):
	print("y")
default:
	print("x")
}


//使用where 条件case
switch p {
case let(x,y) where x == y:print("斜线上 x==y")
	
case let(x,y) where x == -y:print("斜线上 x==-y")
	
case (_, _):
	print("未知位置")
}


//符合where条件的进入循环体
var otherNus = [-1,2]
for i in otherNus where i > 0{
	print(i)
	
}








lll: for i in 0...3 {
	for j in 5...6{
		if j == 5 {
			continue lll
		}
		if i == 3{
			break lll
		}
		print("i:\(i) j:\(j)")
	}
}



//: [Next](@next)
