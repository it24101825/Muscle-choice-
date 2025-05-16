package com.jym.util;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {

    // Reads all non-empty lines using BufferedReader, creates file if it does not exist
    public static List<String> readLines(String filePath) throws IOException {
        List<String> lines = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile();
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    lines.add(line);
                }
            }
        }
        return lines;
    }

    // Overwrites the file with the given list of lines using BufferedWriter
    public static void writeLines(String filePath, List<String> lines) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                writer.write(line);
                writer.newLine();
            }
        }
    }

    // Appends a single line to the file, creates file if missing
    public static void appendLine(String filePath, String line) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile();
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(line);
            writer.newLine();
        }
    }

    // Reads all lines using java.nio, creates file if not exists (alternative method)
    public static List<String> readLinesNio(String filePath) throws IOException {
        Path path = Path.of(filePath);
        if (!Files.exists(path)) {
            Files.createFile(path);
        }
        return Files.readAllLines(path);
    }

    // Overwrites file using java.nio, alternative to BufferedWriter approach
    public static void writeLinesNio(String filePath, List<String> lines) throws IOException {
        Path path = Path.of(filePath);
        Files.write(path, lines);
    }

    // Simple read method using java.nio (imported from second FileUtil)
    public static List<String> readLinesSimple(String filePath) throws IOException {
        return Files.readAllLines(Path.of(filePath));
    }

    // Simple write method using java.nio (imported from second FileUtil)
    public static void writeLinesSimple(String filePath, List<String> lines) throws IOException {
        Files.write(Path.of(filePath), lines);
    }
}