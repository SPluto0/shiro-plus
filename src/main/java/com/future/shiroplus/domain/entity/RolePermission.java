package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.util.Set;

/**
 * @Date 2019/11/27 18:28
 */
@Data
public class RolePermission {
    private Integer rpId;
    private Integer roleId;
    private Integer permissionId;
    private Set<Permission> permissions;
}
