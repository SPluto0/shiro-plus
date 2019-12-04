package com.future.shiroplus.service.impl;

import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.mapper.PermissionMapper;
import com.future.shiroplus.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2019/11/30 16:50
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    PermissionMapper permissionMapper;
    @Override
    public List<Permission> findPermissionAll() {
        return permissionMapper.findPermissionAll();
    }

    @Override
    public List<Permission> findRoleAndRolePermissionAndPermissionByRid(Integer rid) {
        return permissionMapper.findRoleAndRolePermissionAndPermissionByRid(rid);
    }

    @Override
    public List<Permission> findRoleAndRolePermissionAndPermissionExcludeRid(Integer rid) {
        return permissionMapper.findRoleAndRolePermissionAndPermissionExcludeRid(rid);
    }
}
