package com.jym.trainerManagement.dao;

import com.jym.util.FileUtil;

import java.io.IOException;
import java.util.List;

public class TrainerDAO {
    // Keep the absolute path from the first version as priority
    private static final String FILE_PATH = "D:\\java\\untitled\\data\\trainers.txt";

    // Read all trainers from file
    public List<String> getAllTrainers() throws IOException {
        return FileUtil.readLines(FILE_PATH);
    }

    // Add a trainer (append mode, more efficient and safe)
    public void addTrainer(String name, String specialization, String contact) throws IOException {
        String trainerData = name + "," + specialization + "," + contact;
        FileUtil.appendLine(FILE_PATH, trainerData);
    }

    // Delete trainer by matching full line content
    public void deleteTrainer(String trainerToDelete) throws IOException {
        List<String> trainers = FileUtil.readLines(FILE_PATH);
        trainers.removeIf(line -> line.trim().equals(trainerToDelete.trim()));
        FileUtil.writeLines(FILE_PATH, trainers);
    }
}
