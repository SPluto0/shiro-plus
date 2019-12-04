package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * @Date 2019/11/30 14:33
 */
@Data
public class Dept {
    private Integer deptId;
    private Integer deptName;
    private Timestamp createTime;
    private Integer flag;
}
