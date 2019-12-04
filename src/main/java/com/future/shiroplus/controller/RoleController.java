package com.future.shiroplus.controller;

import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.domain.entity.Role;
import com.future.shiroplus.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Date 2019/11/30 18:15
 */
@RestController
public class RoleController {
    @Autowired
    private RoleService roleService;
    @GetMapping("/system/user/role/{userId}")
    public List selectedList(@PathVariable("userId")Integer userId){
        List<Role> list = roleService.findRoleByUserId(userId);
        return list;
    }
    @GetMapping("/system/user/nonrole/{userId}")
    public List nonSelectedList(@PathVariable("userId")Integer userId){
        List<Role> list = roleService.findRoleExcludeUserId(userId);
        return list;
    }


    @GetMapping("/system/user/allotRole/{userId}")
    public Integer allotRole(@PathVariable("userId")Integer userId){
        Integer data= roleService.allotRole(userId);
        return data;
    }
}
