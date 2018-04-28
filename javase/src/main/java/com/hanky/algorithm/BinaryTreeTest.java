package com.hanky.algorithm;

public class BinaryTreeTest {
    public static void main(String[] args) {
        BinaryTree binaryTree = new BinaryTree(6);
        binaryTree.insert(5);
        binaryTree.insert(4);
        binaryTree.insert(10);
        binaryTree.insert(7);
        binaryTree.insert(28);
        binaryTree.inOrderTraverse();
        binaryTree.inOrderByStack();
    }
}
