package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/**
 * Created by Yong on 2019/10/29.
 */
@Service
public class UserService {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    public void add(String name,String mobile){
        String sql ="insert into user (name,mobile) values(?,?)";
        this.jdbcTemplate.update(sql,name,mobile);
    }
    public Integer getAllUserNumber(){
        String sql = "select count(*) from user";
        Integer count = this.jdbcTemplate.queryForObject(sql,Integer.class);
        return count;
    }
}
