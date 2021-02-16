package com.future.shiroplus.service.impl;

import com.future.shiroplus.domain.entity.User;
import com.future.shiroplus.mapper.UserMapper;
import com.future.shiroplus.service.UserService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public boolean regist(String userName, String pwd) {
        User user = userMapper.isRegist(userName);
        if(null != user){
            return false;
        }
        user = new User();
        Map<String, String> map = encryption(pwd);
        user.setUserName(userName);
        user.setPwd(map.get("password"));
        return false;
    }

    public Map<String,String> encryption(String pwd){
        String salt = new SecureRandomNumberGenerator().nextBytes().toHex();
        String password = new Md5Hash(pwd, salt, 2).toString();
        Map<String,String> map = new HashMap<>();
        map.put("salt",salt);
        map.put("password",password);
        return map;
    }
}
