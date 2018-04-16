package com.hanky.invtry.controller;


import com.hanky.invtry.message.RegisterResponse;
import com.hanky.invtry.message.Response;
import com.hanky.invtry.message.User;
import com.hanky.invtry.repo.dao.LoginDao;
import com.hanky.invtry.repo.entity.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class UserManagerController {
    @Autowired
    private LoginDao loginDao;

    @RequestMapping("/user")
    public User getUser(@RequestBody User user){
        log.info("resolve user manager controller");
        user.setName(user.getName().toUpperCase());
        return user;
    }

    @RequestMapping("/register")
    public Response register(@RequestBody UserInfo userInfo){
        RegisterResponse registerResponse = new RegisterResponse();
        log.info("register user");
        try {
            loginDao.saveUserInfo(userInfo);
            registerResponse.setResult("0000","success");
        } catch (Exception e) {
            log.error("error ",e);
            registerResponse.setResult("9999","failed");
        }
        return registerResponse;
    }

    @GetMapping("/hello")
    public String hello(){
        log.info("resolve hello controller");
        return "hello spring boot";
    }
}
