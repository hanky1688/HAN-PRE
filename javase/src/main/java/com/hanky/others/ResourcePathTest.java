package com.hanky.others;

import java.io.File;

public class ResourcePathTest {
    public static void main(String[] args) {

        final String path = ResourcePathTest.class.getClassLoader().getResource("gutenberg/alice30.txt").getPath();
        System.out.println(path);

        File file = new File(ResourcePathTest.class.getResource("/").getPath());
        System.out.println(file.getAbsolutePath());
        // 下面位置在 D:\workspace\project1\out\test\classes
        File file1 = new File(ResourcePathTest.class.getClassLoader().getResource(".").getPath());
        // 下面位置为空
        File file2 = new File(ResourcePathTest.class.getClassLoader().getResource("/").getPath());
        // 下面位置在 D:\workspace\project1\out\test\resources\1.png
        File file3 = new File(ResourcePathTest.class.getClassLoader().getResource("1.png").getPath());


    }
}
