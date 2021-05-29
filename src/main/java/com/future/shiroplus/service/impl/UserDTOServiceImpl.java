package com.future.shiroplus.service.impl;


import com.future.shiroplus.domain.dto.UserDTO;
import com.future.shiroplus.mapper.UserDTOMapper;
import com.future.shiroplus.service.UserDTOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserDTOServiceImpl implements UserDTOService {
    @Autowired
    private UserDTOMapper userDTOMapper;
    @Override
    public  List<UserDTO> queryRolse(String username) {
       List<UserDTO> userDTO = userDTOMapper.findUserDTOByUserName(username);
        return userDTO;
    }

    @Override
    public UserDTO loginPassword(String userName) {
        UserDTO userDTO = userDTOMapper.findUserDTOByUserNameTO(userName);
        return userDTO;
    }
}
