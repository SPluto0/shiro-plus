package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author Guanpin
 * @create 2021-01-15-22:37
 * @Description
 **/
@Data
public class Work {
    private Integer workId;
    private String workName;
    private String content;
    private Integer teacherId;
    private String teacherName;
    private Integer deptId;
    private String courseName;
    private Integer courseId;
    private Integer count;
    private Integer actualCount;
    private Date decorateTime;
    private Date takingTime;
    private Date actualTakingTime;
    private Integer isStart;
    private Integer status;
    private String remark;
    private Integer isSnsNotice;
    private Integer isWxNotice;
    private Integer isTimeingRemind;
    private Integer isAccessory;
    private String accessoryUrl;
    private Date createTime;
    private Date updateTime;
    private Integer flag;

    private boolean isFirstPage = true;
    private Integer firstPage = 1;
    private Integer prePage = 1;
    private boolean isLastPage = true;
    private Integer pages = 1;
    private Integer total = 1;
    private Integer pageNum = 1;
    private Integer pageSize = 5;
}
