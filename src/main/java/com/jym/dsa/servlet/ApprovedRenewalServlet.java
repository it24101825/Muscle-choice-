package com.jym.dsa.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.jym.dsa.model.RenewalRecord;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/approvedRenewals")
public class ApprovedRenewalServlet extends HttpServlet {
    private static final String RENEWAL_FILE = "D:\\java\\untitled\\data\\renewal.txt";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if admin is logged in
        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        // Read approved renewals from file
        List<RenewalRecord> approvedRenewals = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(RENEWAL_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Status: succeeded")) {
                    String[] parts = line.split(", ");
                    String memberId = parts[0].replace("Member ID: ", "");
                    String name = parts[1].replace("Name: ", "");
                    int durationDays = Integer.parseInt(parts[2].replace("Duration: ", "").replace(" days", ""));
                    String bank = parts[3].replace("Bank: ", "");
                    String transactionId = parts[4].replace("Transaction ID: ", "");
                    String renewalDateStr = parts[5].replace("Renewal Date: ", "").replace(", Status: succeeded", "");
                    LocalDate renewalDate = LocalDate.parse(renewalDateStr);

                    approvedRenewals.add(new RenewalRecord(memberId, name, durationDays, bank, transactionId, renewalDate));
                }
            }
        } catch (IOException e) {
            request.setAttribute("error", "Error reading approved renewals: " + e.getMessage());
        }

        // Sort using Insertion Sort by last renewal date
        insertionSort(approvedRenewals);

        // Set sorted renewals as request attribute
        request.setAttribute("approvedRenewals", approvedRenewals);

        // Forward to JSP
        request.getRequestDispatcher("/jsp/admin/ApprovedRenewal.jsp").forward(request, response);
    }

    private void insertionSort(List<RenewalRecord> list) {
        for (int i = 1; i < list.size(); i++) {
            RenewalRecord key = list.get(i);
            int j = i - 1;
            while (j >= 0 && list.get(j).compareTo(key) > 0) {
                list.set(j + 1, list.get(j));
                j--;
            }
            list.set(j + 1, key);
        }
    }
}