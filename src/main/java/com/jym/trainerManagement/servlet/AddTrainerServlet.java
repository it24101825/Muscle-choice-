package com.jym.trainerManagement.servlet;

import com.jym.trainerManagement.dao.TrainerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AddTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String contact = request.getParameter("contact");

        if (name != null && !name.trim().isEmpty() &&
                specialization != null && !specialization.trim().isEmpty() &&
                contact != null && !contact.trim().isEmpty()) {
            try {
                TrainerDAO trainerDAO = new TrainerDAO();
                trainerDAO.addTrainer(name, specialization, contact);
                response.sendRedirect("jsp/admin/Trainers.jsp?success=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/admin/Trainers.jsp?error=true");
            }
        } else {
            response.sendRedirect("jsp/admin/Trainers.jsp?error=true");
        }
    }
}