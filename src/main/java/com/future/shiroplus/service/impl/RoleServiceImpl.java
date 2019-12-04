package com.future.shiroplus.service.impl;

import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.domain.entity.Role;
import com.future.shiroplus.mapper.RoleMapper;
import com.future.shiroplus.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2019/11/30 16:44
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public List<Role> findRoleAll() {
        return roleMapper.findRoleAll();
    }

    @Override
    public Role findRoleById(int role_id) {
        return roleMapper.findRoleById(role_id);
    }

    @Override
    public List<Role> findRoleByUserId(Integer userId) {
        return roleMapper.findRoleByUserId(userId);
    }

    @Override
    public List<Role> findRoleExcludeUserId(Integer userId) {
        return roleMapper.findRoleExcludeUserId(userId);
    }

    @Override
    public Integer allotRole(Integer userId) {
        return roleMapper.allotRole(userId);
    }


}
