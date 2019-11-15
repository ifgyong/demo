package com.example.demo;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Assertions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import sun.jvm.hotspot.utilities.Assert;

import javax.annotation.security.RunAs;

//@RunWith(SpringJUnit4ClassRunner.class)

@SpringBootTest
class DemoApplicationTests {

    @Autowired
    private UserService userService;
    @BeforeAll
    void setup(){
        System.out.println("测试开始");
    }
    @Test
     void contextLoads() {
        userService.add("1","18516570116");
        userService.add("2","18516570117");
        userService.add("3","18516570118");
        System.out.println("userCount:"+userService.getAllUserNumber());
//        Assert.that(userService.getAllUserNumber());

        Assertions.assertEquals(true,userService.getAllUserNumber()==1);
    }
    @Test
    void test1(){
        System.out.println("测试开始");

    }

}
