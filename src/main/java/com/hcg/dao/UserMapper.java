package com.hcg.dao;

import com.hcg.bean.User;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {

    @Select("select * from user where username=#{username}")
    public User QueryUserByUsername(String username);

    @Select("select * from users where phone=#{phone}")
    public User QueryUserByPhone(String phone);

    @Select("select * from user where email=#{email}")
    public User QueryUserByEmail(String email);
}
