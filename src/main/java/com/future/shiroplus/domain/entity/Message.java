package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @Date 2019/11/27 18:22
 */
@Data
public class Message implements Serializable {
    private Integer mId;
    private Integer mFrom;
    private Integer mTo;
    private Integer mPosterType;
    private String mTitle;
    private String mContent;
    private String mAttachment;
    private Integer mRead;
    private Timestamp createTime;
    private Integer isDel;
    private Timestamp delTime;
    private Integer leavel;

}
