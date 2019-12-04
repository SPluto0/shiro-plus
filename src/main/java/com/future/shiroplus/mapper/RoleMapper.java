package com.future.shiroplus.mapper;

import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.domain.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {
   Role findRoleById(Integer roleId);

    List<Role> findRoleAll();


    List<Role> findRoleExcludeUserId(Integer userId);

    List<Role> findRoleByUserId(Integer userId);

    Integer allotRole(Integer userId);
}
