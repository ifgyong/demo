//: [Previous](@previous)

import Foundation

//


var dic = [String : Any]()
dic["name"] = "老王"
dic["age"] = 12
dic["address"] = "地址在哪里呢"

for (key,value) in dic{
	print(key,value)
}

print("-----")
dic.removeValue(forKey: "name")
for (key,value) in dic{
	print(key,value)
}


