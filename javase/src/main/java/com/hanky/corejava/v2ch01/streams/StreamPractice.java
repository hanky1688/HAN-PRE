package com.hanky.corejava.v2ch01.streams;

import java.util.Optional;

public class StreamPractice {
    public static void main(String[] args) {
        Optional<String> optionalString = Optional.of("abc");
        String result = optionalString.orElse("");
        System.out.println(result);

        optionalString = Optional.empty();
        System.out.println(optionalString.orElse("result is empty"));
    }
}
