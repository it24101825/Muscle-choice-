package com.jym.userManagement.servlet;

import com.jym.userManagement.dao.MemberDAO;
import com.jym.userManagement.model.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginMemberServlet extends HttpServlet {
    private MemberDAO memberDAO;

    @Override
    public void init() throws ServletException {
        memberDAO = new MemberDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member member = memberDAO.getMemberByEmail(email);
        if (member != null && member.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("member", member);
            response.sendRedirect("jsp/member/MemberProfile.jsp");
        } else {
            response.sendRedirect("jsp/member/MemberLogin.jsp?error=true");
        }
    }
}