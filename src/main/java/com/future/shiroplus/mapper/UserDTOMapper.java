package com.future.shiroplus.mapper;

import com.future.shiroplus.domain.dto.UserDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDTOMapper {
    List<UserDTO> findUserDTOByUserName(String username);
    UserDTO findUserDTOByUserNameTO(String username);

}
