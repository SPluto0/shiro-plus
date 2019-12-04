package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * @Date 2019/11/30 14:35
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
