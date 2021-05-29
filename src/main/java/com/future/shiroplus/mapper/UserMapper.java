package com.future.shiroplus.mapper;

import com.future.shiroplus.domain.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    List<User> findUserAll();

    User isRegist(String userName);

    void insert(User user);
}
