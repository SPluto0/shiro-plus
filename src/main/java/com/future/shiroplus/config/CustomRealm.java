package com.future.shiroplus.config;

import com.future.shiroplus.domain.dto.UserDTO;
import com.future.shiroplus.service.UserDTOService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Date 2019/11/27 18:32
 */
public class CustomRealm extends AuthorizingRealm {

    @Autowired
    private UserDTOService userDTOService;

    /**
     * 授权管理
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //从主体获取用户
        String username=(String)principals.getPrimaryPrincipal();
        System.out.println("授权管理");
        //从数据库查询用户的角色
        List<UserDTO> userDTOS = userDTOService.queryRolse(username);

        SimpleAuthorizationInfo simpleAuthorizationInfo=new SimpleAuthorizationInfo();
        for (UserDTO userDTO : userDTOS) {
            simpleAuthorizationInfo.addRole(userDTO.getRoleName());
            simpleAuthorizationInfo.addStringPermission(userDTO.getPermissionName());
        }
        return simpleAuthorizationInfo;
    }


    /**
     * 认证信息
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("认证信息");
        //从主体获取传过来的用户
        String userName=(String)token.getPrincipal();
        //通过用户传过来从数据库进行密码
        String password=userDTOService.loginPassword(userName);
        if(password == null){
            return null;
        }
        //加盐
        ByteSource salt = ByteSource.Util.bytes(userName);
        //获取当前自定义的realm
        String realmName = this.getName();

        SimpleAuthenticationInfo simpleAuthenticationInfo=new SimpleAuthenticationInfo(userName, password, salt, realmName);
        return simpleAuthenticationInfo;
    }

}
