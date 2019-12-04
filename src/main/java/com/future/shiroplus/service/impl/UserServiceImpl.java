package com.future.shiroplus.service.impl;

import com.future.shiroplus.domain.entity.User;
import com.future.shiroplus.mapper.UserMapper;
import com.future.shiroplus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2019/11/27 20:01
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> findUserAll() {
        return userMapper.findUserAll();
    }
}
