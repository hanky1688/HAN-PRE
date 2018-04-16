package com.hanky.invtry.repo.mapper;

import com.hanky.invtry.repo.entity.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserInfoMapper {
    @Insert({
            "insert into user_info(name,password,mobile) ",
            "values(#{name,jdbcType=VARCHAR},#{password,jdbcType=VARCHAR},#{mobile,jdbcType=VARCHAR} )"
    })
    int insert(UserInfo userInfo);
}
