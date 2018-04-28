package com.hanky.corejava.v2ch01.streams;

import com.hanky.utils.ResourceUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

public class CountLongWords
{
   public static void main(String[] args) throws IOException
   {
      final String filePath = ResourceUtils.getFilePath("gutenberg/alice30.txt");
      String contents = new String(Files.readAllBytes(Paths.get(filePath)), StandardCharsets.UTF_8);
      List<String> words = Arrays.asList(contents.split("\\PL+"));

      long count = 0;
      for (String w : words)
      {
         if (w.length() > 12) count++;
      }
      System.out.println(count);

      count = words.stream().filter(w -> w.length() > 12).count();
      System.out.println(count);

      count = words.parallelStream().filter(w -> w.length() > 12).count();
      System.out.println(count);
   }
}