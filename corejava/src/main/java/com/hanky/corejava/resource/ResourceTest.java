package com.hanky.corejava.resource;

import javax.swing.*;
import java.awt.*;
import java.io.InputStream;
import java.net.URL;
import java.util.Scanner;

public class ResourceTest {
    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            JFrame frame = new ResourceTestFrame();
            frame.setTitle("ResourceTest");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setVisible(true);
        });
    }
}

/**
 * A frame that loads image and text resource
 */
class ResourceTestFrame extends JFrame {
    private static final int DEFAULT_WIDTH = 900;
    public static final int DEFAULT_HEIGHT = 600;

    public ResourceTestFrame() {
        setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);

        URL aboutURL = getClass().getResource("about.gif");
        Image img = new ImageIcon(aboutURL).getImage();
        setIconImage(img);

        JTextArea textArea = new JTextArea();

        InputStream stream = getClass().getResourceAsStream("about.txt");
        try (Scanner in = new Scanner(stream, "UTF-8")) {
            while (in.hasNext()) {
                textArea.append(in.nextLine() + "\n");
            }
        }
        add(textArea);

    }
}
