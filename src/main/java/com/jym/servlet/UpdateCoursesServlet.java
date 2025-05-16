package com.jym.servlet;

import com.jym.dao.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class UpdateCoursesServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String coursesInput = request.getParameter("courses");
        if (coursesInput != null && !coursesInput.trim().isEmpty()) {
            List<String> courses = Arrays.asList(coursesInput.split("\n"));
            CourseDAO courseDAO = new CourseDAO();
            try {
                courseDAO.updateCourses(courses);
                response.sendRedirect("jsp/admin/AdminDashboard.jsp?success=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/admin/AdminDashboard.jsp?error=true");
            }
        } else {
            response.sendRedirect("jsp/admin/AdminDashboard.jsp?error=true");
        }
    }
}