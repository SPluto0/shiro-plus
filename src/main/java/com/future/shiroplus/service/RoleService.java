package com.future.shiroplus.service;

import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.domain.entity.Role;

import java.util.List;

/**
 * @Date 2019/11/30 16:43
 */
public interface RoleService {
    List<Role> findRoleAll();

    Role findRoleById(int role_id);

    List<Role> findRoleByUserId(Integer userId);

    List<Role> findRoleExcludeUserId(Integer userId);


    Integer allotRole(Integer userId);
}
