<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.model.Member" %>
<html>
<head>
  <title>Member - Account Management</title>
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
  <!-- Tab Navigation -->
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

  <!-- Account Management Content -->
  <div class="mt-3">
    <!-- 5. Settings & Support -->
    <div class="card mb-4">
      <div class="card-header">
        <h3>Settings & Support</h3>
      </div>
      <div class="card-body">
        <p><a href="${pageContext.request.contextPath}/jsp/member/ChangePassword.jsp" class="btn btn-secondary m-1">Change Password</a></p>
        <p><a href="${pageContext.request.contextPath}/jsp/member/Support.jsp" class="btn btn-secondary m-1">Support</a></p>
      </div>
    </div>

<%--    new section need to be added here--%>

    <!-- Logout -->
    <div class="text-center">
      <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-danger">Logout</a>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>