package com.hanky.utils;

import java.io.File;

public class ResourceUtils {
    public static final File getResource(String file) {
        return new File(ResourceUtils.class.getClassLoader().getResource(file).getPath());
    }

    public static final String getFilePath(String file){
        final File file1 = new File(ResourceUtils.class.getClassLoader().getResource(file).getPath());
        return file1.getPath();
    }


}
