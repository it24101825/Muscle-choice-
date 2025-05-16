package com.jym.util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class JymUpdatesQueue {
    private List<String> queue;

    public JymUpdatesQueue() {
        this.queue = new ArrayList<>();
    }

    public void enqueue(String update) {
        queue.add(update);
    }

    public String dequeue() {
        if (queue.isEmpty()) {
            return null;
        }
        return queue.remove(0);
    }

    public void remove(String update) {
        queue.remove(update);
    }

    public List<String> getQueue() {
        return new ArrayList<>(queue); // Return a copy to prevent external modification
    }

    public boolean isEmpty() {
        return queue.isEmpty();
    }

    public void saveToFile(String filePath) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String update : queue) {
                writer.write(update);
                writer.newLine();
            }
        }
    }

    public void loadFromFile(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile();
            return;
        }
        queue.clear();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    queue.add(line);
                }
            }
        }
    }
}