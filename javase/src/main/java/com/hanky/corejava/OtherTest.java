package com.hanky.corejava;

import java.util.Properties;
import java.util.Set;

public class OtherTest {
    public static void main(String[] args) {
        final Properties properties = System.getProperties();
        final Set<Object> keySet = properties.keySet();
        keySet.forEach(e -> System.out.println(e + "=" + properties.get(e)));
//        System.out.println(properties);
    }
}
