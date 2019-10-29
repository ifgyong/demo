package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@Controller
public class loginController {
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(HashMap map){
        map.put("mobile","18516570115");
        map.put("name","fgyong");
        return "login";
    }
}
