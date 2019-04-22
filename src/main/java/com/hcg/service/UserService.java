package com.hcg.service;

import com.hcg.bean.User;
import com.hcg.exception.CustomerException;

public interface UserService extends BaseService<User> {
    public void register(User user) throws CustomerException;
}
