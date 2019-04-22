package com.hcg.controller;

import com.hcg.bean.User;
import com.hcg.exception.CustomerException;
import com.hcg.result.Result;
import com.hcg.result.ResultUtils;
import com.hcg.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@ResponseBody
@RequestMapping("/user")
public class UserController {
    private Logger logger= LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public Result register(@Valid User user, BindingResult bindingResult) throws CustomerException {
        //判断校验是否失败
        if(bindingResult.hasErrors()){
            String message = getCheckInfo(bindingResult);
            return ResultUtils.buildFail(105,message);
        }
        logger.info("校验成功，开始注册....");
        userService.register(user);
        logger.info("注册成功,用户名{}",user.getUsername());
        return ResultUtils.buildSuccess();
    }

    private String getCheckInfo(BindingResult bindingResult) {
        //效验失败
        //取出失败信息
        List<ObjectError> errors = bindingResult.getAllErrors();
        ArrayList list = new ArrayList();
        //取出失败信息拼接成字符串
        for (ObjectError error:errors){
            String msg = error.getDefaultMessage();
            list.add(msg);
        }

        //拼接字符串
        String message=org.apache.commons.lang3.StringUtils.join(list,",");
        logger.info("校验失败，失败信息为{}",message);
        return message;
    }

}
