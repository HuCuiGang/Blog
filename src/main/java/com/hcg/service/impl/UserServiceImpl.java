package com.hcg.service.impl;

import com.hcg.bean.User;
import com.hcg.dao.UserMapper;
import com.hcg.exception.CustomerException;
import com.hcg.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.UUID;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public void register(User user) throws CustomerException {
        if(!checkEmpty(user)){
            logger.debug("校验失败!");
            return;
        }
        logger.info("校验用户信息是否已使用....");
        checkUse(user);
        logger.info("开始执行注册....");

        //生成盐
        String salt= crateSalt();
        //设置盐
        user.setSalt(salt);

        //密码加密
        String md5Password=md5Password(user.getPassword(),salt);
        //设置密码
        user.setPassword(md5Password);
        user.setUpdated(new Date());
        user.setCreated(new Date());

        //保存用户到数据库
        userMapper.insertSelective(user);
    }
    /**
     * 随机生成盐
     * @return
     */
    private String crateSalt() {
        Date date=new Date();
        return DigestUtils.md5DigestAsHex((date.toString()+ UUID.randomUUID().toString()).getBytes());
    }

    /**
     * 密码加密
     * @param password 密码
     * @param salt 盐
     * @return
     */
    private String md5Password(String password, String salt) {
        return DigestUtils.md5DigestAsHex((salt+password).getBytes());
    }
    /**
     * 校验用户信息是否使用
     * @param user
     * @throws CustomerException 如果抛出异常代表使用过相关信息
     */

    private void checkUse(User user) throws CustomerException {
        if(userMapper.QueryUserByUsername(user.getUsername())!=null){
            logger.info("用户名已经注册:"+user.getUsername());
            throw  new CustomerException("用户名已经注册:"+user.getUsername());
        }
        if(userMapper.QueryUserByEmail(user.getEmail())!=null){
            logger.info("邮箱已经注册:"+user.getEmail());
            throw  new CustomerException("邮箱已经注册:"+user.getEmail());
        }
        if(userMapper.QueryUserByPhone(user.getPhone())!=null){
            logger.info("电话号码已经注册:"+user.getPhone());
            throw  new CustomerException("电话号码已经注册:"+user.getPhone());
        }
    }

    private boolean checkEmpty(User user) {
        if(user==null){
            logger.debug("用户信息为为空");
            return false;
        }
        if(StringUtils.isEmpty(user.getUsername())){
            logger.debug("用户名为空");
            return false;
        }
        if(StringUtils.isEmpty(user.getPhone())){
            logger.debug("电话号码为空");
            return false;
        }
        if(StringUtils.isEmpty(user.getPassword())){
            logger.debug("密码为空");
            return false;
        }
        if(StringUtils.isEmpty(user.getEmail())){
            logger.debug("邮箱为空");
            return false;
        }
        logger.debug("判空成功!");
        return true;
    }
}
