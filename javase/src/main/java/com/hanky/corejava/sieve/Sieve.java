package com.hanky.corejava.sieve;

import java.util.BitSet;
import java.util.StringJoiner;

import static org.apache.commons.lang3.BooleanUtils.isFalse;
import static org.apache.commons.lang3.BooleanUtils.isTrue;

/**
 * This program runs the Sieve of Erathostenes benchmark . It computes all primes up to 2 , 000 , 000 .
 * version 1.21 2004 - 08 - 03
 * author Cay Horstmann
 * 首先将所有的位置为 “ 开 ” 状态， 然后将已知素数的倍数所对应的位都置为 “关 ” 状态
 */
public class Sieve {
    public static void main(String[] args) {
        int n = 2000000;
        long start = System.currentTimeMillis();
        BitSet bitSet = new BitSet(n + 1);
        int i;
        for (i = 2; i <= n; i++) {
            bitSet.set(i);
        }

        int primesCount = 0;
        i = 2;
        while (i * i <= n) {
            //if i is primes
            if (isFalse(bitSet.get(i))) {
                i++;
                continue;
            }

            primesCount++;
            int k = i * 2;
            while (k <= n) {
                bitSet.clear(k);
                k += i;
            }
            i++;
        }
        while (i <= n) {
            if (isTrue(bitSet.get(i))) {
                primesCount++;
            }
            i++;
        }
        long cost = System.currentTimeMillis() - start;
        System.out.println(primesCount + " primes");
        System.out.println(cost + " milliseconds");

        StringJoiner stringJoiner = new StringJoiner(",");
        for (int j = 0; j < 100; j++) {
            if (isTrue(bitSet.get(j))) {
                stringJoiner.add("" + j);

            }
        }
        System.out.println(stringJoiner.toString());
    }

}
