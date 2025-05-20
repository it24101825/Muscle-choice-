package com.jym.userManagement.servlet;

import com.jym.userManagement.dao.MemberDAO;
import com.jym.userManagement.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

public class RegisterMemberServlet extends HttpServlet {
    private MemberDAO memberDAO;

    @Override
    public void init() throws ServletException {
        memberDAO = new MemberDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String membershipType = request.getParameter("membershipType");

        if (memberDAO.emailExists(email)) {
            response.sendRedirect("jsp/member/MemberRegistration.jsp?error=true");
            return;
        }

        String id = memberDAO.generateMemberId();
        LocalDate today = LocalDate.now();
        Member member = new Member(id, name, email, today, password, membershipType, today);
        memberDAO.saveMember(member);

        response.sendRedirect("jsp/member/MemberRegistration.jsp?success=true");
    }
}