package com.jym.servlet;

import com.jym.dao.JymUpdateDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteJymUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updateToDelete = request.getParameter("updateToDelete");

        if (updateToDelete != null && !updateToDelete.trim().isEmpty()) {
            try {
                JymUpdateDAO jymUpdateDAO = new JymUpdateDAO();
                jymUpdateDAO.deleteJymUpdate(updateToDelete);
                response.sendRedirect("jsp/admin/AdminDashboard.jsp?deleteSuccess=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/admin/AdminDashboard.jsp?error=true");
            }
        } else {
            response.sendRedirect("jsp/admin/AdminDashboard.jsp?error=true");
        }
    }
}