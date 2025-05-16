package com.jym.dao;

import com.jym.util.FileUtil;

import java.io.IOException;
import java.util.List;

public class CourseDAO {
    private static final String FILE_PATH = "D:\\java\\untitled\\data\\courses.txt";

    public List<String> getAllCourses() throws IOException {
        return FileUtil.readLines(FILE_PATH);
    }

    public void updateCourses(List<String> courses) throws IOException {
        FileUtil.writeLines(FILE_PATH, courses);
    }
}
