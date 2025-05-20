<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Admin" %>
<%@ page import="com.jym.dsa.model.RenewalRecord" %>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Approved Renewals</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
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
        <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminRenewalApproval.jsp">Renew request</a>
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
    List<RenewalRecord> approvedRenewals = (List<RenewalRecord>) request.getAttribute("approvedRenewals");
    String error = (String) request.getAttribute("error");
  %>
  <div class="container mt-5">
    <h2 class="text-center">Approved Renewals</h2>

    <!-- Error Message -->
    <% if (error != null) { %>
    <div class="alert alert-danger" role="alert">
      <%= error %>
    </div>
    <% } %>

    <div class="mt-3">
      <% if (approvedRenewals == null || approvedRenewals.isEmpty()) { %>
      <div class="alert alert-info" role="alert">
        No approved renewals found.
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
        </tr>
        </thead>
        <tbody>
        <% for (RenewalRecord renewal : approvedRenewals) { %>
        <tr>
          <td><%= renewal.getMemberId() %></td>
          <td><%= renewal.getName() %></td>
          <td><%= renewal.getDurationDays() %> days</td>
          <td><%= renewal.getBank() %></td>
          <td><%= renewal.getTransactionId() %></td>
          <td><%= renewal.getRenewalDate() %></td>
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