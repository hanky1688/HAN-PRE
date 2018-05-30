package com.hanky.algorithm;

import java.util.Stack;

import static java.util.Objects.nonNull;
import static org.apache.commons.lang3.BooleanUtils.isFalse;
//https://blog.csdn.net/fengrunche/article/details/52305748

public class BinaryTree {
    private Node root = null;

    public BinaryTree(int value) {
        root = new Node(value);
        root.leftChild  = null;
        root.rightChild = null;
    }

    /**
     * 查找
     * @param value
     * @return
     */
    public Node findKey(int value) {
        Node current = root;
        while (true){
            if (current == null){
                return null;
            }

            if (current.value == value){
                return current;
            }
            if (value < current.value){
                current = current.leftChild;
            } else if (value > current.value) {
                current = current.rightChild;
            }
        }
    }

    /**
     * 插入
     * @param value
     * @return
     */
    public String insert(int value) {
        final Node node = new Node(value);
        if (root == null) {
            root = node;
            return "success";
        }

        Node current = root;
        Node parent = null;
        while (true){
            if (value < current.value){
                parent = current;
                current = current.leftChild;
                if (current == null){
                    parent.leftChild = node;
                    break;
                }
            }else if (value > current.value){
                parent = current;
                current = current.rightChild;
                if (current == null){
                    parent.rightChild = node;
                    break;
                }
            }else {
                return "having same value in BinaryTree";
            }
        }
        return "success";
    }

    /**
     * //中序遍历(递归)：
     *    1、调用自身来遍历节点的左子树
     *    2、访问这个节点
     *    3、调用自身来遍历节点的右子树
     */
    public void inOrderTraverse() {
        System.out.print("中序遍历:");
        inOrderTraverse(root);
        System.out.println();
    }    //中序遍历递归操作
    private void inOrderTraverse(Node node) {
        if (node == null){
            return ;
        }
        inOrderTraverse(node.leftChild);
        node.display();
        inOrderTraverse(node.rightChild);
    }
    /**
     * 中序非递归遍历：
     *     1）对于任意节点current，若该节点不为空则将该节点压栈，并将左子树节点置为current，重复此操作，直到current为空。
     *     2）若左子树为空，栈顶节点出栈，访问节点后将该节点的右子树置为current
     *     3) 重复1、2步操作，直到current为空且栈内节点为空。
     */
    public void inOrderByStack() {
        System.out.print("中序非递归遍历:");
        Stack<Node> stack = new Stack<>();
        Node current = root;
        while (nonNull(current) || isFalse(stack.isEmpty())){
            while (nonNull(current)){
                stack.push(current);
                current = current.leftChild;
            }

            if (isFalse(stack.isEmpty())){
                current = stack.pop();
                current.display();
                current = current.rightChild;
            }
        }
        System.out.println();
    }
    /**
     * //前序遍历(递归)：
     *    1、访问这个节点
     *    2、调用自身来遍历节点的左子树
     *    3、调用自身来遍历节点的右子树
     */
    public void preOrderTraverse() {
        System.out.print("前序遍历:");
        preOrderTraverse(root);
        System.out.println();
    }

    private void preOrderTraverse(Node node) {
        if (node == null) {
            return;
        }

        node.display();
        preOrderTraverse(node.leftChild);
        preOrderTraverse(node.rightChild);
    }
    public void preOrderByStack() {}   //前序遍历非递归操作
    public void postOrderTraverse() {} //后序遍历
    public void postOrderByStack() {}  //后序遍历非递归操作
 //   public int getMinValue() {} //得到最小(大)值
 //   public boolean delete(int value) {} //删除
}
