package com.hanky.corejava.collection;

import java.util.BitSet;

public class BitSetTest {
    public static void main(String[] args) {
        BitSet bucketOfBits = new BitSet();
        bucketOfBits.set(3);
        bucketOfBits.set(1);
        final boolean b = bucketOfBits.get(3);
        System.out.println(b);
        System.out.println(bucketOfBits.get(2));
        System.out.println(bucketOfBits);
        System.out.println(bucketOfBits.length());//1+highestIndex

        //1011
        String bitString = "1011";
        BitSet bitSet = getBitSet(bitString);
        System.out.println(bitSet);

        BitSet bitSet1 = getBitSet("1100");
        bitSet.or(bitSet1);
        System.out.println(bitSet);
        System.out.println(getBitString(bitSet));

    }

    public static BitSet getBitSet(String bitString){
        final char[] chars = bitString.toCharArray();
        BitSet bitSet = new BitSet(chars.length);
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] == '1'){
                bitSet.set(i);
            }
        }
        return bitSet;
    }
    public static String getBitString(BitSet bitSet) {
        StringBuffer sb = new StringBuffer();
        for (int i=0;i<bitSet.length();i++){
            if (bitSet.get(i)){
                sb.append(1);
            }else {
                sb.append(0);
            }
        }
        return sb.toString();
    }
}
