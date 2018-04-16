package com.hanky.algorithm;


public class Node {
     int value;
     Node leftChild;
     Node rightChild;

    public Node(int value) {
        this.value = value;
        this.leftChild = null;
        this.rightChild = null;
    }

    public void display() {
        System.out.print(this.value + "\t");
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return String.valueOf(value);
    }
}
