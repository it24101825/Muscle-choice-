package com.jym.courseManagement.servlet;

import com.jym.messageManagement.dao.JymUpdateDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AddJymUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updateMessage = request.getParameter("updateMessage");

        if (updateMessage != null && !updateMessage.trim().isEmpty()) {
            JymUpdateDAO jymUpdateDAO = new JymUpdateDAO();
            try {
                jymUpdateDAO.addJymUpdate(updateMessage);
                response.sendRedirect("jsp/admin/JymUpdates.jsp?success=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/admin/JymUpdates.jsp?error=true");
            }
        } else {
            response.sendRedirect("jsp/admin/JymUpdates.jsp?error=true");
        }
    }
}
