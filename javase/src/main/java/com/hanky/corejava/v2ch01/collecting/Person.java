package com.hanky.corejava.v2ch01.collecting;

import lombok.Data;

@Data
public class Person {
    private int id;
    private String name;

    public Person(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String toString() {
        return getClass().getName() + "[id=" + id + ",name=" + name + "]";
    }
}
