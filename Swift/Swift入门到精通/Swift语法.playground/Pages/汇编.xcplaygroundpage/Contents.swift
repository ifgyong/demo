//: [Previous](@previous)

import Foundation

/**
movq -0x18(%rbp),%rdi//将(rbp - 0x18)的存储的值赋值给 rdi
leaq -0x18(%rbp),%rdi //将(rbp - 0x18)的内存地址 赋值给 rdi

jump 0x10000212 调到该地址，不回头。
call 0x10000999  进入该函数，函数执行完还会回来继续执行下一步。
call *%rax  进入rax存储的函数地址，函数执行完还会回来继续执行下一步。
寄存器
r开头：64位占8字节
e开头：32位4字节
a开头：16位 2字节
al bh:8位 1字节

LLDB 常用指令
0x1000077f0

// rip存储 下句CPU的下一条指令地址
//  movq   $0x1, 0x5d21(%rip) 内存地址：0x0000000100001acf+0x5d21=0x1000077F0  
//  movq   $0x2, 0x5d1e(%rip) 内存地址：0x0000000100001ada+0x5d1e=0x1000077F8
//  movq   $0x7, 0x5d1b(%rip) 内存地址：0x0000000100001ae5+0x5d1b=0x100007800
//  movq   $0x8, 0x5d18(%rip) 内存地址：0x0000000100001af0+0x5d18=0x100007808
//  movb   $0x0, 0x5d19(%rip) 内存地址：0x0000000100001af0+0x5d19=0x100007809
//  leaq   0x5cf2(%rip), %rdi
*/

//: [Next](@next)
