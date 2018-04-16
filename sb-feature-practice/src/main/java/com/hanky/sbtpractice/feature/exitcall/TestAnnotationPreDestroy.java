package com.hanky.sbtpractice.feature.exitcall;

import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;

@Component
public class TestAnnotationPreDestroy {
    @PreDestroy
    public void destory() {

        System.out.println("我被销毁了、、、、、我是用的@PreDestory的方式、、、、、、");
        System.out.println("我被销毁了、、、、、我是用的@PreDestory的方式、、、、、、");
    }
}
