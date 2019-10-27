package com.example.demo;
import javax.sql.DataSource;
import javax.xml.crypto.Data;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserTemplate {
    private DataSource dataSource;
    private JdbcTemplate UserTemplate;
    public UserTemplate(DataSource dataSource){
        this.dataSource = dataSource;
        this.UserTemplate = new JdbcTemplate(dataSource);
    }
    public void setDataSource(DataSource db){
        this.dataSource = db;
    }
    public DataSource dataSource(){
        return this.dataSource;
    }
    public boolean inseret(String name , int age , int sex){
        String sql = "INSERT INTO USER (name,age,sex) VALUES(?,?,?)";
        int ret = this.UserTemplate.update(sql,new Object[]{name,age,sex});
        return ret>0 ? true:false;
    }
    public ArrayList<User> userList(int page){
        ArrayList<User> arr= new ArrayList<>();
        int start=0,end=0;
        if (page<=1){
            start=0;
            end = 5;
        }else {
            start = (page-1)*5;
            end = page *5;
        }
        String sql = "select * from user limit "+start+","+end;
        this.UserTemplate.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                User student = new User();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setSex(rs.getInt("sex"));
                student.setAddress(rs.getNString("address"));
                arr.add(student);
            }
        });
        return arr;
    }
}
