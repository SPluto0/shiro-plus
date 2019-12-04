package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.util.Set;

/**
 * @Date 2019/11/27 18:25
 */
@Data
public class Role {
    private Integer roleId;
    private String roleName;
    private Set<RolePermission> rolePermissions ;
}
