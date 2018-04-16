package com.hanky.sbtpractice.feature.accessargs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AccessArgsBean {

    @Autowired
    private ApplicationArguments args;

    @Autowired
    public AccessArgsBean(ApplicationArguments args) {
        boolean debug = args.containsOption("debug");
        List<String> files = args.getNonOptionArgs();
        // if run with "--debug logfile.txt" debug=true, files=["logfile.txt"]
    }
}
