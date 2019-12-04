package com.future.shiroplus.service;

import com.future.shiroplus.domain.entity.Permission;

import java.util.List;

public interface PermissionService {
    List<Permission> findPermissionAll();

    List<Permission> findRoleAndRolePermissionAndPermissionByRid(Integer rid);

    List<Permission> findRoleAndRolePermissionAndPermissionExcludeRid(Integer rid);
}
