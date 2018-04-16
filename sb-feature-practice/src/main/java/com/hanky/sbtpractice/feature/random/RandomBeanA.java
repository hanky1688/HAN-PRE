package com.hanky.sbtpractice.feature.random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class RandomBeanA implements RandomBean {
    @Value("${my.number.in.range}")
    private int myNum ;


    @Override
    public int getMyNum() {
        return myNum;
    }
}
