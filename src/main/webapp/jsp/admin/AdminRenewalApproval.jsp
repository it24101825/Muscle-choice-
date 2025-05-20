<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Admin" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<html>
<head>
    <title>Admin Renewal Approval</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">

    <!-- Ensure nav-tabs stay in one line -->
    <style>
        .nav-tabs-wrapper {
            overflow-x: auto;
            white-space: nowrap;
        }
        .nav-tabs {
            flex-wrap: nowrap;
        }
        .nav-tabs .nav-item {
            white-space: nowrap;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Admin Dashboard</h2>

    <!-- Tabs Navigation -->
    <div class="nav-tabs-wrapper mb-3">
        <ul class="nav nav-tabs flex-nowrap" id="adminTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminDashboard.jsp">Members</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/CourseUpdates.jsp">Course Updates</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/Trainers.jsp">Trainers</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/Messages.jsp">Messages</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/JymUpdates.jsp">Jym Updates</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminUploadImage.jsp">Gallery</a>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="members-tab" data-bs-toggle="tab" data-bs-target="#renew-request" type="button" role="tab" aria-controls="renew-request" aria-selected="true">Renew request</button>
            </li>
        </ul>
    </div>
    <!-- End Tabs Navigation -->

    <%
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("../AdminLogin.jsp");
            return;
        }
        String pendingFile = "D:\\java\\untitled\\data\\pending.txt";
        List<String> pendingRequests = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(pendingFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Status: pending")) {
                    pendingRequests.add(line);
                }
            }
        } catch (IOException e) {
            out.println("<div class='alert alert-danger' role='alert'>Error reading pending requests: " + e.getMessage() + "</div>");
        }
        String success = request.getParameter("success");
    %>
    <div class="container mt-5">
        <!-- Success Message -->
        <% if ("approved".equals(success)) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            Renewal approved successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>
        <h2 class="text-center">Admin Renewal Approval</h2>

        <!-- Button to View Approved Renewals -->
        <div class="text-end mb-3">
            <a href="${pageContext.request.contextPath}/approvedRenewals" class="btn btn-primary">View Approved Renewals</a>
        </div>

        <div class="mt-3">
            <% if (pendingRequests.isEmpty()) { %>
            <div class="alert alert-info" role="alert">
                No pending renewal requests.
            </div>
            <% } else { %>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Member ID</th>
                    <th>Name</th>
                    <th>Duration</th>
                    <th>Bank</th>
                    <th>Transaction ID</th>
                    <th>Renewal Date</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% for (String pendingRequest : pendingRequests) {
                    String[] parts = pendingRequest.split(", ");
                    String memberId = parts[0].replace("Member ID: ", "");
                    String name = parts[1].replace("Name: ", "");
                    String duration = parts[2].replace("Duration: ", "").replace(" days", "");
                    String bank = parts[3].replace("Bank: ", "");
                    String transactionId = parts[4].replace("Transaction ID: ", "");
                    String renewalDate = parts[5].replace("Renewal Date: ", "").replace(", Status: pending", "");
                %>
                <tr>
                    <td><%= memberId %></td>
                    <td><%= name %></td>
                    <td><%= duration %> days</td>
                    <td><%= bank %></td>
                    <td><%= transactionId %></td>
                    <td><%= renewalDate %></td>
                    <td>
                        <form action="${pageContext.request.contextPath}/approveRenewal" method="post">
                            <input type="hidden" name="memberId" value="<%= memberId %>">
                            <input type="hidden" name="duration" value="<%= duration %>">
                            <button type="submit" class="btn btn-success btn-sm">Approve</button>
                        </form>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>