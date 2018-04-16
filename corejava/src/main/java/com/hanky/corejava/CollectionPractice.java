package com.hanky.corejava;

import lombok.extern.slf4j.Slf4j;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

@Slf4j
public class CollectionPractice {
    public static void main(String[] args) {
        testLinkRevomeSecondElement();
        log.info("test add");
        testLinkListAddSecondElement();

    }


    private static void testLinkRevomeSecondElement() {
        List<String> staff = new LinkedList<>(); // LinkedList implements List
        staff.add(" Amy ");
        staff.add("Bob");
        staff.add(" Carl ");
        Iterator<String> iter = staff.iterator();
        String first = iter.next(); // visit first element
        String second = iter.next(); //visit second element
        iter.remove(); // remove last visited element

        staff.forEach(e -> System.out.println(e));
        System.out.println("*************");
        iter.forEachRemaining(e -> System.out.println(e));
    }

    private static void testLinkListAddSecondElement() {
        List<String> staff = new LinkedList();
        staff.add("Amy");
        staff.add("Bob");
        staff.add("Carl");
        ListIterator<String> iter = staff.listIterator();
        iter.next(); // skip past first element
        iter.add("Juliet");

        staff.forEach(e -> System.out.println(e));
        System.out.println("*************");
        iter.forEachRemaining(e -> System.out.println(e));

    }
}
