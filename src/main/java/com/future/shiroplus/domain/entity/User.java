package com.future.shiroplus.domain.entity;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @Date 2019/11/27 18:22
 */
@Data
@ToString
public class User implements Serializable {
    private Integer userId;
    private String userName;
    private String pwd;
    private String idCard;
    private String tel;
    private String urgencyTel;
    private String wx;
    private String openId;
    private String qq;
    private String email;
    private char sex;
    private Integer age;
    private Integer bornDate;
    private String headImg;
    private String signature;
    private Integer deptId;
    private String prof;
    private String flag;
    private Timestamp createTime;
    private Timestamp updateTime;

}
