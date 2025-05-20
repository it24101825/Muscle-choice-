package com.jym.messageManagement.servlet;

import com.jym.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

public class SubmitContactServlet extends HttpServlet {
    private static final String CONTACT_FILE_PATH = "D:\\java\\untitled\\data\\contact_messages.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        if (email == null || email.trim().isEmpty() || message == null || message.trim().isEmpty()) {
            response.sendRedirect("jsp/public/Contact.jsp?error=true");
            return;
        }

        try {
            // Format: timestamp,email,message
            String contactEntry = LocalDateTime.now() + "," + email + "," + message;
            List<String> messages = FileUtil.readLines(CONTACT_FILE_PATH);
            messages.add(contactEntry);
            FileUtil.writeLines(CONTACT_FILE_PATH, messages);
            response.sendRedirect("jsp/public/Contact.jsp?success=true");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendRedirect("jsp/public/Contact.jsp?error=true");
        }
    }
}