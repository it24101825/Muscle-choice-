<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Member" %>
<%@ page import="com.jym.messageManagement.dao.JymUpdateDAO, java.util.List" %>
<html>
<head>
  <title>Member - Jym Updates</title>
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
  List<String> updates = null;
  try {
    JymUpdateDAO jymUpdateDAO = new JymUpdateDAO();
    updates = jymUpdateDAO.getAllUpdates();
  } catch (Exception e) {
    updates = null; // Fail-safe fallback
  }
%>
<div class="container mt-5">
  <!-- Tab Navigation -->
  <ul class="nav nav-tabs" id="memberTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/MemberProfile.jsp">Profile Overview</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link active" href="${pageContext.request.contextPath}/jsp/member/GymUpdates.jsp">Jym Updates</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/AccountManagement.jsp">Account Management</a>
    </li>
  </ul>

  <!-- Gym Updates Content -->
  <div class="mt-3">
    <!-- 4. Announcements & Events -->
    <div class="card mb-4">
      <div class="card-header">
        <h3>Announcements & Events</h3>
      </div>
      <div class="card-body">
        <p><strong>New updates on this week:</strong></p>
        <ul>
          <%
            if (updates == null || updates.isEmpty()) {
          %>
          <li>No updates available at the moment.</li>
          <%
          } else {
            for (String update : updates) {
          %>
          <li><%= update %></li>
          <%
              }
            }
          %>
        </ul>
        <p><strong>Special Offers or Discounts:</strong></p>
        <ul>
          <!-- Keep other sections empty or add static data if needed -->
        </ul>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>