package com.hanky.sbtpractice.feature;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component

public class MyBean {
    @Value("${name}")
    private String name;

    public String getName(){
        return name;
    }


}
