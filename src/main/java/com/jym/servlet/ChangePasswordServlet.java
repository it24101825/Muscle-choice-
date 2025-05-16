package com.jym.servlet;

import com.jym.dao.MemberDAO;
import com.jym.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Member member = (Member) request.getSession().getAttribute("member");
        if (member == null) {
            response.sendRedirect("MemberLogin.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (currentPassword != null && !currentPassword.trim().isEmpty() &&
                newPassword != null && !newPassword.trim().isEmpty() &&
                confirmPassword != null && !confirmPassword.trim().isEmpty()) {
            try {
                MemberDAO memberDAO = new MemberDAO();
                if (!member.getPassword().equals(currentPassword)) {
                    response.sendRedirect("jsp/member/ChangePassword.jsp?error=Incorrect current password");
                    return;
                }
                if (!newPassword.equals(confirmPassword)) {
                    response.sendRedirect("jsp/member/ChangePassword.jsp?error=Passwords do not match");
                    return;
                }
                if (newPassword.length() < 6) {
                    response.sendRedirect("jsp/member/ChangePassword.jsp?error=New password must be at least 6 characters long");
                    return;
                }
                member.setPassword(newPassword);
                memberDAO.updateMember(member);
                response.sendRedirect("jsp/member/ChangePassword.jsp?success=true");
            } catch (IOException e) {
                response.sendRedirect("jsp/member/ChangePassword.jsp?error=Failed to update password");
            }
        } else {
            response.sendRedirect("jsp/member/ChangePassword.jsp?error=All fields are required");
        }
    }
}