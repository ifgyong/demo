//
//  FYNodeAdpter.m
//  VCStatistics
//
//  Created by fgy on 2019/9/3.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "FYNodeAdpter.h"
#import "FYNodeMap.h"

@implementation FYNodeAdpter 
- (void)append:(FYNodeMap* )node{
    NSAssert(node != nil, @"添加节点不能为nil");
    if (self.top == NULL) {
        self.top = node;
        self.tail = node;
    }else{
        self.tail.next = node;
        self.tail = node;
    }
}
- (NSString *)description{
    NSMutableString *str =[NSMutableString string];
    if (self.top == NULL) {
        return @"node is nil";
    }else{
        FYNodeMap *  node = self.top;
		NSMutableString *head = [NSMutableString stringWithString:@"+"];
		for (; node != nil; node = node.next) {
            //↴ 替换
            //⇄  交换
			NSString *type = node.tp == FYNodeMapTypeExchange?@" ⇄ |":@" ↴ |";
			NSString *sel1  = NSStringFromSelector(node.selName);
			NSString * sel2 = NSStringFromSelector(node.toSelName);
			
			if (node.tp == FYNodeMapTypeExchange) {
				NSString *subStr=[NSString stringWithFormat:@"%@ %@ %@ -> %@ -> imp:%p \n",type,head,sel1,sel2,node.imp];
				[str appendString:subStr];
			}else if (node.tp == FYNodeMapTypeReplaced){
				NSString *subStr=[NSString stringWithFormat:@"%@ %@ %@ -> imp:%p \n",type,head,sel1,node.imp];
				[str appendString:subStr];
			}
			
			[head appendString:@"  "];
        }
    }
    return [str copy];
}
@end
