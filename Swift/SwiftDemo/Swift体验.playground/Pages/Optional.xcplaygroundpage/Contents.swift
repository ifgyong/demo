import UIKit
import Foundation

var str = "Hello, playground"

let url = NSURL(string: "www.baidu.com")


var age:Int? = nil
var name:String? = "老王"


if let myurl = url {
	print(myurl)
}
//当age =nil 或者 name = nil，不会进入if内部
//age和name都不为nil 则进入内部
if let newAge = age , let newName = name {
	print(newName,newAge)
}

// ??  是value是nil 则将后边的值赋值给 cName
var cName:String? = nil
cName = cName ?? "默认"
print(cName)




let dataList:[String]?
dataList = ["老李","老张"]
//datalist 可能为nil 所以使用？
// ！ 是强行解包，一定有值则不会有问题，为nil 则崩溃
let count = dataList?.count ?? 0
print(count)




