<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Member" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Member Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
    Member member = (Member) session.getAttribute("member");
    if (member == null) {
        response.sendRedirect("MemberLogin.jsp");
        return;
    }
    LocalDate expiryDate = member.getLastRenewal().plusYears(1); // Assuming 1-year membership
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>
<div class="container mt-5">
    <!-- Tab Navigation -->
    <ul class="nav nav-tabs" id="memberTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link active" href="${pageContext.request.contextPath}/jsp/member/MemberProfile.jsp">Profile Overview</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/GymUpdates.jsp">Gym Updates</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/AccountManagement.jsp">Account Management</a>
        </li>
    </ul>

    <!-- Profile Overview Content -->
    <div class="mt-3">
        <!-- 1. Welcome Panel -->
        <div class="card mb-4">
            <div class="card-body">
                <h2 class="card-title text-center">Welcome, <%= member.getName() %>!</h2>
                <p class="text-center">Member ID: <%= member.getId() %></p>
            </div>
        </div>

        <!-- 2. Membership Status -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Membership Status</h3>
            </div>
            <div class="card-body">
                <p><strong>Plan Type:</strong> <%= member.getMembershipType() %></p>
                <p><strong>Next Billing Date:</strong> <%= expiryDate.format(formatter) %></p>
                <p><strong>Payment History:</strong></p>
                <ul>
                    <li>Payment on <%= member.getLastRenewal().format(formatter) %> - <%= member.getMembershipType() %> Plan</li>
                    <!-- Add more payment history here if available -->
                </ul>
                <a href="${pageContext.request.contextPath}/jsp/member/RenewMembership.jsp" class="btn btn-primary">Renew Membership</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>