package com.jym.dsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.jym.userManagement.model.Member;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/approveRenewal")
public class ApproveRenewalServlet extends HttpServlet {
    private static final String PENDING_FILE = "D:\\java\\untitled\\data\\pending.txt";
    private static final String RENEWAL_FILE = "D:\\java\\untitled\\data\\renewal.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if admin is logged in
        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("../AdminLogin.jsp");
            return;
        }

        // Get form data
        String memberId = request.getParameter("memberId");
        String durationStr = request.getParameter("duration");
        int durationDays = Integer.parseInt(durationStr);

        // Read pending requests
        List<String> pendingRequests = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(PENDING_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Member ID: " + memberId) && line.contains("Status: pending")) {
                    // Update status to succeeded and move to renewal file
                    String succeededLine = line.replace("Status: pending", "Status: succeeded");
                    try (BufferedWriter writer = new BufferedWriter(new FileWriter(RENEWAL_FILE, true))) {
                        writer.write(succeededLine);
                        writer.newLine();
                    }
                } else {
                    pendingRequests.add(line);
                }
            }
        }

        // Rewrite pending.txt without the approved request
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PENDING_FILE))) {
            for (String line : pendingRequests) {
                writer.write(line);
                writer.newLine();
            }
        }

        // Update member session (simulated; update database in real scenario)
        Member member = (Member) request.getSession().getAttribute("memberId-" + memberId); // Adjust based on your session management
        if (member != null) {
            member.setLastRenewal(LocalDate.now());
            request.getSession().setAttribute("renewalStatus", "succeeded");
        }

        // Redirect to approval page
        response.sendRedirect("jsp/admin/AdminRenewalApproval.jsp?success=approved");
    }
}