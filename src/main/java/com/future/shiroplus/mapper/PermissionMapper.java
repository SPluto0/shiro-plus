package com.future.shiroplus.mapper;

import com.future.shiroplus.domain.entity.Permission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionMapper {
    List<Permission> findPermissionAll();

    List<Permission> findRoleAndRolePermissionAndPermissionByRid(Integer rid);

    List<Permission> findRoleAndRolePermissionAndPermissionExcludeRid(Integer rid);
}
