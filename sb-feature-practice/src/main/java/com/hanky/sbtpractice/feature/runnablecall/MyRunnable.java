package com.hanky.sbtpractice.feature.runnablecall;

import com.hanky.sbtpractice.feature.MyBean;
import com.hanky.sbtpractice.feature.random.RandomBean;
import com.hanky.sbtpractice.feature.random.RandomBeanA;
import com.hanky.sbtpractice.feature.random.RandomBeanB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class MyRunnable implements CommandLineRunner {
    @Autowired
    private MyBean myBean;
    @Value("${my.number}")
    private int randomNum;
    @Autowired
    private RandomBeanA randomBeanA;
    @Autowired
    private RandomBeanB randomBeanB;


    @Override
    public void run(String... args) throws Exception {

        System.out.println("myBean.name=" + myBean.getName());
        System.out.println("my num=" + randomNum);
        System.out.println("random bean a = " + randomBeanA.getMyNum());
        System.out.println("random bean b = " + randomBeanB.getMyNum());
    }
}
