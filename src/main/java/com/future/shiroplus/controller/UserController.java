package com.future.shiroplus.controller;


import com.future.shiroplus.domain.entity.Permission;
import com.future.shiroplus.domain.entity.Role;
import com.future.shiroplus.domain.entity.User;
import com.future.shiroplus.service.PermissionService;
import com.future.shiroplus.service.RoleService;
import com.future.shiroplus.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Date 2019/11/27 19:55
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;

    @PostMapping("/user/login")
    public String login(String userName, String pwd, HttpServletRequest request){
        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token=new UsernamePasswordToken(userName, pwd);
        try {
            subject.login(token);
            if (subject.isAuthenticated()==true) {
                System.out.println("成功");
                request.getSession().setAttribute("userName",userName);
                return "index.html";
            }
        } catch (AuthenticationException e) {
            e.printStackTrace();
            System.out.println(e);
        }
        return "login";
    }

    @GetMapping("/system/userlist.html")
    public ModelAndView userPageInfo(Integer pageNum, HttpServletRequest request){
        if(pageNum ==null||pageNum == 0){
            pageNum = 1;
        }
        String userName = ((String) request.getSession().getAttribute("userName"));
        List<User> list = userService.findUserAll();
        Role role = roleService.findRoleById(1);

        Page<User> page = PageHelper.startPage(pageNum,5);
        PageInfo<User> userPageInfo = new PageInfo<>(list);

        ModelAndView map = new ModelAndView("system/userlist");
        map.addObject("userPageInfo",userPageInfo);
        map.addObject("role",role);
        return map;
    }

    @GetMapping("/system/rolelist.html")
    public ModelAndView rolePageInfo(Integer pageNum){
        if(pageNum ==null||pageNum == 0){
            pageNum = 1;
        }
        List<Role> list = roleService.findRoleAll();

        Page<Role> page = PageHelper.startPage(pageNum,5);
        PageInfo<Role> rolePageInfo = new PageInfo<>(list);

        ModelAndView map = new ModelAndView("system/rolelist");
        map.addObject("rolePageInfo",rolePageInfo);
        return map;
    }

    @GetMapping("/system/permissionlist.html")
    public ModelAndView permissionPageInfo(Integer pageNum){
        if(pageNum ==null||pageNum == 0){
            pageNum = 1;
        }
        List<Permission> list = permissionService.findPermissionAll();

        Page<Permission> page = PageHelper.startPage(pageNum,5);
        PageInfo<Permission> permissionPageInfo = new PageInfo<>(list);

        ModelAndView map = new ModelAndView("system/permissionlist");
        map.addObject("permissionPageInfo",permissionPageInfo);
        return map;
    }

}
