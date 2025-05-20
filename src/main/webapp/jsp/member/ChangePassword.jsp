<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Member" %>
<html>
<head>
  <title>Member - Change Password</title>
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
%>
<div class="container mt-5">
  <ul class="nav nav-tabs" id="memberTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/MemberProfile.jsp">Profile Overview</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/GymUpdates.jsp">Gym Updates</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link active" href="${pageContext.request.contextPath}/jsp/member/AccountManagement.jsp">Account Management</a>
    </li>
  </ul>

  <div class="mt-3">
    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success mt-3">Password changed successfully!</div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger mt-3"><%= request.getParameter("error") %></div>
    <% } %>
    <div class="card mb-4">
      <div class="card-header">
        <h3>Change Password</h3>
      </div>
      <div class="card-body">
        <form action="${pageContext.request.contextPath}/changePassword" method="post">
          <div class="mb-3">
            <label for="currentPassword" class="form-label">Current Password</label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
          </div>
          <div class="mb-3">
            <label for="newPassword" class="form-label">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
          </div>
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm New Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
          </div>
          <button type="submit" class="btn btn-primary">Change Password</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>