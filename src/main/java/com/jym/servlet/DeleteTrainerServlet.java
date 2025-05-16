package com.jym.servlet;

import com.jym.dao.TrainerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainerToDelete = request.getParameter("trainerToDelete");

        if (trainerToDelete != null && !trainerToDelete.trim().isEmpty()) {
            try {
                TrainerDAO trainerDAO = new TrainerDAO();
                trainerDAO.deleteTrainer(trainerToDelete);
                response.sendRedirect("jsp/admin/DeleteTrainer.jsp?deleteSuccess=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/admin/DeleteTrainer.jsp?error=true");
            }
        } else {
            response.sendRedirect("jsp/admin/DeleteTrainer.jsp?error=true");
        }
    }
}