package com.future.shiroplus.domain.dto;

import lombok.Data;

/**
 * @Date 2019/11/27 19:24
 */
@Data
public class UserDTO {
    private String userId;
    private String userName;
    private String pwd;
    private String roleName;
    private String permissionName;
    private String remark;
    private String url;

}
