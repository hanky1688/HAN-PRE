package com.hanky.corejava.collection;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class CollectionsTest {
    public static void main(String[] args) {
       arraysTest();
//        testCopies();
        testSubList();


    }

    private static void testSubList() {
        List<String> staff = createList();

        final List<String> subList = staff.subList(2, 4);
        subList.clear();
        System.out.println("subList:" + subList);
        System.out.println("staff:" + staff);
    }

    private static List<String> createList() {
        List<String> staff = new ArrayList<>();
        staff.add("Amy");
        staff.add("Bob");
        staff.add("Cherry");
        staff.add("John");
        return staff;
    }

    private static void testCopies() {
        final List<String> copies = Collections.nCopies(100, "DEFAULT");
//        copies.add("Lucy");  //UnsupportedOperationException
    }


    private static void arraysTest() {
        //asList fixed-size, but element can modify
        System.out.println("arrays test");
        Gson gson = new Gson();
        String[] card = new String[3];
        final List<String> cardList = Arrays.asList(card);
        cardList.set(2,"Lucy"); //modify element
        System.out.println(gson.toJson(card));

        //cardList.add("Lucy");  //UnsupportedOperationException
//        cardList.remove(1);

        final List<String> names = Arrays.asList("Amy", "Bob", "Cherry");
//        names.add("John"); //UnsupportedOperationException
    }
}
