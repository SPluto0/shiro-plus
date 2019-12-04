package com.future.shiroplus.controller;

import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.service.PermissionService;
import com.future.shiroplus.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Date 2019/11/30 18:15
 */
@RestController
public class PermissionController {
    @Autowired
    private PermissionService permissionService;
    @GetMapping("/system/role/permission/{rid}")
    public List selectedList(@PathVariable("rid")Integer rid){
        List<Permission> list = permissionService.findRoleAndRolePermissionAndPermissionByRid(rid);
        return list;
    }
    @GetMapping("/system/role/nonpermission/{rid}")
    public List nonSelectedList(@PathVariable("rid")Integer rid){
        List<Permission> list = permissionService.findRoleAndRolePermissionAndPermissionExcludeRid(rid);
        return list;
    }
}
