package com.hanky.invtry;

import com.hanky.invtry.utils.FileUtils;
import org.flywaydb.core.api.FlywayException;
import org.flywaydb.core.internal.util.FileCopyUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.zip.CRC32;

public class TestFlyway {

    private static byte[] loadAsBytes(String filePath) {
        try {
            InputStream inputStream = new FileInputStream(filePath);
            return FileCopyUtils.copyToByteArray(inputStream);
        } catch (IOException e) {
            throw new FlywayException("Unable to load resource: " + filePath, e);
        }
    }

    private static String loadAsString(String encoding, String filePath) {
        try {
            InputStream inputStream = new FileInputStream(filePath);

            Reader reader = new InputStreamReader(inputStream, Charset.forName(encoding));
            return FileCopyUtils.copyToString(reader);
        } catch (IOException e) {
            throw new FlywayException("Unable to load resource: " + filePath + " (encoding: " + encoding + ")", e);
        }
    }

    public static void main(String[] args) throws IOException {
        String filePath = "D:\\githome\\HAN-PRE\\inv-core\\src\\main\\resources\\flyway\\version\\V1.0.0__ddl_create_purchase.sql";
        String encoding = "UTF-8";

        //String mode
        final String fileString = loadAsString(encoding, filePath);
        final int checksum = calculateChecksum(fileString);
        System.out.println("String mode: " + checksum);

        final byte[] bytes = loadAsBytes(filePath);
        final int checksum1 = calculateChecksum(bytes);
        System.out.println("byte mode : " + checksum1);


        final byte[] bytes1 = FileUtils.toByteArray(filePath);
        final byte[] bytes2 = FileUtils.toByteArray2(filePath);
        final byte[] bytes3 = FileUtils.toByteArray3(filePath);
        System.out.println("0:" + bytes.length + ",1:" + bytes1.length + ",2:" + bytes2.length + ",3:" + bytes3.length);

    }

    private static int calculateChecksum(String str) {
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
