package com.jym.messageManagement.dao;

import com.jym.util.FileUtil;

import java.io.IOException;
import java.util.List;

public class JymUpdateDAO {
    private static final String FILE_PATH = "D:\\java\\untitled\\data\\jymUpdate.txt";

    // Store only the update message (no timestamp)
    public void addJymUpdate(String updateMessage) throws IOException {
        List<String> updates = FileUtil.readLines(FILE_PATH);
        updates.add(updateMessage); // No timestamp
        FileUtil.writeLines(FILE_PATH, updates);
    }

    // Retrieve all updates from file
    public List<String> getAllUpdates() throws IOException {
        return FileUtil.readLines(FILE_PATH);
    }

    // Optional delete method if needed (from first version)
    public void deleteJymUpdate(String updateToDelete) throws IOException {
        List<String> updates = FileUtil.readLines(FILE_PATH);
        if (updates.remove(updateToDelete)) {
            FileUtil.writeLines(FILE_PATH, updates);
        }
    }
}
