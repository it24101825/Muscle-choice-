package com.jym.messageManagement.servlet;

import com.jym.messageManagement.dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteMessageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messageToDelete = request.getParameter("messageToDelete");

        if (messageToDelete != null && !messageToDelete.trim().isEmpty()) {
            try {
                MessageDAO messageDAO = new MessageDAO();
                messageDAO.deleteMessage(messageToDelete);
                response.sendRedirect("jsp/admin/DeleteMessages.jsp?deleteSuccess=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/admin/DeleteMessages.jsp?error=true");
            }
        } else {
            response.sendRedirect("jsp/admin/DeleteMessages.jsp?error=true");
        }
    }
}