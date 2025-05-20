package com.jym.dsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.jym.userManagement.model.Member;
import com.jym.dsa.model.RenewalRequest;

import java.io.*;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.Queue;

@WebServlet("/renewMembership")
public class RenewMembershipServlet extends HttpServlet {
    private static final String PENDING_FILE = "D:\\java\\untitled\\data\\pending.txt";
    private static final Queue<RenewalRequest> renewalQueue = new LinkedList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if member is logged in
        Member member = (Member) request.getSession().getAttribute("member");
        if (member == null) {
            response.sendRedirect("MemberLogin.jsp");
            return;
        }

        // Get form data
        String durationStr = request.getParameter("renewalDuration");
        String bank = request.getParameter("bank");
        String transactionId = request.getParameter("transactionId");

        // Validate transaction ID (server-side)
        if (!transactionId.matches("[0-9]{8,}")) {
            response.sendRedirect("jsp/member/RenewMembership.jsp?error=Invalid transaction ID. It must be 8 or more digits.");
            return;
        }

        // Parse duration
        int durationDays;
        try {
            durationDays = Integer.parseInt(durationStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("jsp/member/RenewMembership.jsp?error=Invalid renewal duration.");
            return;
        }

        // Validate bank
        if (!bank.equals("Peoples Bank") && !bank.equals("BOC") && !bank.equals("Sampath Bank")) {
            response.sendRedirect("jsp/member/RenewMembership.jsp?error=Invalid bank selection.");
            return;
        }

        // Create renewal request
        LocalDate renewalDate = LocalDate.now();
        RenewalRequest renewalRequest = new RenewalRequest(
                member.getId(),
                member.getName(),
                durationDays,
                bank,
                transactionId,
                renewalDate
        );

        // Set pending status in session
        request.getSession().setAttribute("renewalStatus", "pending");
        request.getSession().setAttribute("renewalRequest", renewalRequest);

        // Add to queue and write to pending file
        synchronized (renewalQueue) {
            renewalQueue.offer(renewalRequest);
        }
        saveToPendingFile(renewalRequest);

        // Redirect to MemberProfile.jsp with pending status
        response.sendRedirect("jsp/member/MemberProfile.jsp?status=pending");
    }

    private void saveToPendingFile(RenewalRequest request) throws IOException {
        File file = new File(PENDING_FILE);
        File parentDir = file.getParentFile();
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(request.toString() + ", Status: pending");
            writer.newLine();
        }
    }
}