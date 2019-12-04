package com.future.shiroplus.domain.entity;

import lombok.Data;

/**
 * @Date 2019/11/27 18:26
 */
@Data
public class Permission {
    private Integer permissionId;
    private String permissionName;
    private String remark;
    private String url;
    private Integer pid;

}
