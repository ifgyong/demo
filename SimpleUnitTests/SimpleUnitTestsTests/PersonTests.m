//
//  PersonTests.m
//  SimpleUnitTestsTests
//
//  Created by fgy on 2019/4/16.
//  Copyright © 2019 test. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    Person *p1=[[Person alloc]initWithDic:@{}];
    XCTAssertTrue(p1!= nil,@"p1 is nil");
    
    Person *p2=[[Person alloc]initWithDic:@{@"age":@(11),@"name":@"张三"}];
    XCTAssertTrue([p2.name isEqualToString:@"张三"]&&p2.age == 11,@"dic to person faild");
    
    NSDictionary *info = @{@"age":@(11),@"name":@"张三"};
    NSMutableArray *array=[NSMutableArray array];
    for (NSInteger i = 0; i <1000; i ++) {
        [array addObject:[[Person new]initWithDic:info]];
    }
    XCTAssertTrue(array.count == 1000,@"add person count 100");
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
