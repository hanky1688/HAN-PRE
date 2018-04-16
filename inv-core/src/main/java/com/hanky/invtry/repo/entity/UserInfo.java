package com.hanky.invtry.repo.entity;

import com.hanky.invtry.support.MD5Support;
import lombok.Data;

@Data
public class UserInfo {
    private Integer id;
    private String name;
    private String password;
    private String mobile;

    public void setPassword(String password){
        this.password = MD5Support.MD5(password);
    }
}
