package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 实体类，对应数据库里面的字段，将查询数据库的结果映射进去
 */
@Data
public class Course {
    private Integer courseId;
    private String courseName;
    private Integer courseHour;
    private Integer termId;
    private String remark;
    private Timestamp createTime;
    private Integer flag;
}
