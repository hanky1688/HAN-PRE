package com.hanky.invtry;

import org.apache.commons.lang3.StringUtils;
import org.flywaydb.core.api.FlywayException;
import org.flywaydb.core.internal.util.FileCopyUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.zip.CRC32;

public class TestFlyway {

    public static byte[] loadAsBytes(String filePath) {
        try {
            InputStream inputStream = new FileInputStream(filePath);
            if (inputStream == null) {
                throw new FlywayException("Unable to obtain inputStream for resource: " + filePath);
            }
            return FileCopyUtils.copyToByteArray(inputStream);
        } catch (IOException e) {
            throw new FlywayException("Unable to load resource: " + filePath, e);
        }
    }

    public static String loadAsString(String encoding, String filePath) {
        try {
            InputStream inputStream = new FileInputStream(filePath);
            if (inputStream == null) {
                throw new FlywayException("Unable to obtain inputstream for resource: " + filePath);
            }
            Reader reader = new InputStreamReader(inputStream, Charset.forName(encoding));

            return FileCopyUtils.copyToString(reader);
        } catch (IOException e) {
            throw new FlywayException("Unable to load resource: " + filePath + " (encoding: " + encoding + ")", e);
        }
    }

    public static void main(String[] args) throws IOException {
//        System.setProperty("line.seperator", "\\n");
        String filePath = "D:\\githome\\HAN-PRE\\inv-core\\src\\main\\resources\\flyway\\version\\V1.1__create_wcp_tables.sql";
        String filePath4 = "D:\\githome\\HAN-PRE\\inv-core\\src\\main\\resources\\flyway\\version\\V4.0.0__add_id_manual_verify_case_trans.sql";
        String encoding = "UTF-8";

        //String mode
        testChecksum(filePath, encoding);
        System.out.println();
        testChecksum(filePath4, encoding);

    }

    private static void testChecksum(String filePath, String encoding) {
        System.out.println(StringUtils.substringAfterLast(filePath, "\\"));
        final String fileString = loadAsString(encoding, filePath);
        final int checksum = calculateChecksum(fileString);
        System.out.println("String mode: " + checksum);
        final byte[] bytes1 = fileString.getBytes(StandardCharsets.UTF_8);
        System.out.println("String mode byte length: " + bytes1.length);
//        for (byte b : bytes1) {
//            System.out.println(b);
//        }

        System.out.println("String to bytes : " + calculateChecksum(bytes1));


        //byte mode
        final byte[] bytes = loadAsBytes(filePath);
        final int checksum1 = calculateChecksum(bytes);
        System.out.println("byte mode : " + checksum1);
        System.out.println("byte length: " + bytes.length);
//        for (byte aByte : bytes) {
//            System.out.println(aByte);
//        }

    }

    static int calculateChecksum(String str) {
        final CRC32 crc32 = new CRC32();
        BufferedReader bufferedReader = new BufferedReader(new StringReader(str));
        try {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                crc32.update(line.getBytes("UTF-8"));
            }
        } catch (IOException e) {
            String message = "Unable to calculate checksum";
            throw new FlywayException(message, e);
        }

        return (int) crc32.getValue();

    }

    private static int calculateChecksum(byte[] bytes) {
        final CRC32 crc32 = new CRC32();
        crc32.update(bytes);
        return (int) crc32.getValue();
    }

}
