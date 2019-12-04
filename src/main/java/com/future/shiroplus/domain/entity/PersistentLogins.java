package com.future.shiroplus.domain.entity;

import lombok.Data;

import java.sql.Timestamp;

/**
 * @Date 2019/11/30 14:33
 */
@Data
public class PersistentLogins {
    private String username;
    private String series;
    private String token;
    private Timestamp lastUsed;
}
