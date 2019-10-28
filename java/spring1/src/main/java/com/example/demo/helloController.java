package com.example.demo;

import com.fasterxml.jackson.annotation.JsonAlias;
import org.omg.CORBA.Request;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.validation.constraints.Null;
import javax.xml.crypto.Data;
import java.awt.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RestController
public class helloController {
   static ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("application-beans.xml");
static  DataSource dataSource =
            (DataSource) context.getBean("dataSource");
    static UserTemplate userTemplate = new UserTemplate(dataSource);
    @RequestMapping(value="/login2")
    public String login(){
        return "login";
    }
    @RequestMapping(value="/add", produces={"application/json; charset=UTF-8"})
    public HashMap insertUser(HttpServletRequest request, HttpServletResponse response,String name,int age,int sex){
        boolean ret = userTemplate.inseret(name,age,sex);
        HashMap map = new HashMap();
        if (ret){

            map.put("state","success");
            map.put("data",userList(request,response));
        }else {
            map.put("state","faild");
            map.put("msg","插入数据失败");
        }
        return map;
    }
    @RequestMapping(value="/userlist", produces={"application/json; charset=UTF-8"})
    public HashMap userList(HttpServletRequest request, HttpServletResponse response){
        int page = Integer.parseInt(request.getParameter("page").toString());
        System.out.println("111111");
        HashMap map= this.userTemplate.userList(page);
        return  map;
    }
    public void setUp(){
        context = new ClassPathXmlApplicationContext("application-beans.xml");
        dataSource =
                (DataSource) context.getBean("dataSource");
        userTemplate = new UserTemplate(dataSource);
    }
}
