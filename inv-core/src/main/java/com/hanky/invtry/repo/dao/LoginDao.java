package com.hanky.invtry.repo.dao;

import com.hanky.invtry.repo.entity.UserInfo;
import com.hanky.invtry.repo.mapper.UserInfoMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class LoginDao {
    @Autowired
    private UserInfoMapper userInfoMapper;

    public int saveUserInfo(UserInfo userInfo) throws Exception {
        try {
            return userInfoMapper.insert(userInfo);
        } catch (Exception e) {
            log.error("DB ERROR",e);
            throw new Exception("DB ERROR",e);
        }
    }
}
