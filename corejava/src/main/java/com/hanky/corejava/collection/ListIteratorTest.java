package com.hanky.corejava.collection;

import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

public class ListIteratorTest {
    public static void main(String[] args) {

        List<String> staff = new LinkedList<>();
        staff.add("Amy");
        staff.add("Bob");
        staff.add("Carl");
        final ListIterator<String> iterator = staff.listIterator();
        iterator.next(); //skip past first element
        iterator.add("Juliet");
        iterator.previous();
        iterator.add("Game");
        iterator.previous();
        iterator.previous();
        iterator.add("First");
        iterator.add("Order");
        System.out.println(staff);

    }
}
