package com.jym.dao;

import com.jym.model.Admin;
import com.jym.util.FileUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class AdminDAO {
    private static final String FILE_PATH = "D:\\java\\untitled\\data\\admins.txt";

    public Admin getAdminByUsername(String username) throws IOException {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        for (String line : lines) {
            if (!line.startsWith("UPDATE,")) { // Skip update entries
                String[] parts = line.split(",");
                if (parts.length >= 6 && parts[4].equals(username)) {
                    return new Admin(parts[0], parts[1], parts[2], LocalDate.parse(parts[3]), parts[4], parts[5]);
                }
            }
        }
        return null;
    }

    public void addGymUpdate(String updateMessage) throws IOException {
        String updateData = "UPDATE," + LocalDateTime.now() + "," + updateMessage;
        FileUtil.appendLine(FILE_PATH, updateData);
    }
}
