//
//  main.swift
//  AraryAndString
//
//  Created by Charlie on 2019/8/26.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

import Foundation



//数组 8字节 存储地址，堆空间地址，指向 第二字节 存储引用计数，第三字节 数组数量，第四字节数组容量，后边是数组内容。
var arr = [Int]()
for i in 1...9{
	arr.append(i)
}
//负载0.5 则进行扩容，最小值 4容量
print(Mems.memStr(ofRef: arr))
print(MemoryLayout.stride(ofValue: arr))












//(lldb) register read rax
//rax = 0x3837363534333231
//(lldb) register read rdx
//rdx = 0xe900000000000039 0xe9 代表长度为9，123456789存储的assia码是 0x383736353433323139
//
var str = "123456789"
//var str2 = "123456789012345"// 0x3837363534333231 0xef35343332313039
//var str2 = "12345678901234"   // 0x3837363534333231 0xee00343332313039
//var str2 = "1234567890123"      // 0x3837363534333231 0xed00003332313039
var str2 = "123456789012345678901234"
//movabsq $0x7fffffffffffffe0, %rdx ;
//0xd000000000000019 0x80000001000056c0 0x19是字符串长度

//str2真实地址 ：0x80000001000056c0 - 0x7fffffffffffffe0 = 0x1000056E0
//0x1000056c0 + 0x20 = 0x1000056E0
/*0x1000056e0: 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36  1234567890123456
  0x1000056f0: 00 0a 00 20 00 00 00 00 00 00 00 00 00 00 00 00
*/
print(Mems.memStr(ofVal: &str2))

//从全局变量变成堆空间,开辟堆空间
str2.append("5")
print(Mems.memStr(ofVal: &str2))

//0x000000010053bbe0 + 0x20 = 0x10053bbe0 +0x20 = 0x10053bc00
//0x10053bc00: 0x3837363534333231 0x3635343332313039
//0x10053bc10: 0x3433323130393837

var size = MemoryLayout<String>.stride(ofValue: str2)
var size2 = MemoryLayout<String>.stride(ofValue: str2)
print(size,size2)



