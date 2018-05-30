package com.hanky.corejava.collection;

import java.util.HashMap;
import java.util.Map;

public class MapTest {
    public static void main(String[] args) {
        Map<Integer,String> studentMap = new HashMap<>();
        final String chery = studentMap.putIfAbsent(1, "Chery");
        System.out.println(chery);
        final String name = studentMap.putIfAbsent(1, "Lucy");
        System.out.println(name);
        final String s = studentMap.putIfAbsent(2, null);
        System.out.println(s);
        studentMap.putIfAbsent(2, "Carry");
        System.out.println(studentMap);

    }
}
