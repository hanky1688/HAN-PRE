package com.hanky.corejava.collection;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

public class LinkedListTest {
    public static void main(String[] args) {
        List<String> a = new LinkedList();
        a.add("Amy");
        a.add("Carl");
        a.add("Erica");

        List<String> b = new LinkedList<>();
        b.add("Bob");
        b.add("Doug");
        b.add("Frances");
        b.add("Gloria");

        System.out.println("a is: " + a);
        System.out.println("b is: " + b);

        // merge the words from b into a
        System.out.println("merge the words from b into a ");
        final ListIterator<String> aIter = a.listIterator();
        Iterator<String> bIter = b.iterator();
        while (bIter.hasNext()) {
            if (aIter.hasNext()) {
                aIter.next();
            }
            aIter.add(bIter.next());
        }
        System.out.println(a);

        // remove every second word from b
        System.out.println("remove every second word from b");
        bIter = b.iterator();
        while (bIter.hasNext()) {
            bIter.next();
            if (bIter.hasNext()) {
                bIter.next();
                bIter.remove();
            }
        }

        System.out.println(b);

        // bulk operation : remove all words in b from a
        System.out.println("bulk operation : remove all words in b from a");
        a.removeAll(b);
        System.out.println(a);
    }
}