package com.jym.dao;

import com.jym.util.FileUtil;

import java.io.IOException;
import java.util.List;

public class MessageDAO {
    private static final String FILE_PATH = "D:\\java\\untitled\\data\\contact_messages.txt";

    public List<String> getAllMessages() throws IOException {
        return FileUtil.readLines(FILE_PATH);
    }

    public void deleteMessage(String messageToDelete) throws IOException {
        List<String> messages = FileUtil.readLines(FILE_PATH);
        messages.remove(messageToDelete);
        FileUtil.writeLines(FILE_PATH, messages);
    }
}
