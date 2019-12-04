package com.future.shiroplus.service;



import com.future.shiroplus.domain.dto.UserDTO;

import java.util.List;

/**
 * @Date 2019/11/27 19:34
 */
public interface UserDTOService {
    List<UserDTO> queryRolse(String username);

    String loginPassword(String username);
}
