<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.dao.MessageDAO, java.util.List" %>
<html>
<head>
  <title>Admin Dashboard - Messages</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
  if (session.getAttribute("admin") == null) {
    response.sendRedirect("../AdminLogin.jsp");
    return;
  }
  MessageDAO messageDAO = new MessageDAO();
  List<String> messages = messageDAO.getAllMessages();
%>
<div class="container mt-5">
  <h2 class="text-center">Admin Dashboard</h2>

  <!-- Tab Navigation -->
  <ul class="nav nav-tabs" id="adminTabs" role="tablist">
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
      <button class="nav-link active" id="messages-tab" data-bs-toggle="tab" data-bs-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="true">Messages</button>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/JymUpdates.jsp">Jym Updates</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminUploadImage.jsp">Gallery</a>
    </li>
  </ul>

  <!-- Tab Content -->
  <div class="tab-content" id="adminTabsContent">
    <!-- Messages -->
    <div class="tab-pane fade show active" id="messages" role="tabpanel" aria-labelledby="messages-tab">
      <div class="mt-4">
        <h3>User Messages</h3>
        <table class="table">
          <thead>
          <tr>
            <th>Timestamp</th>
            <th>Email</th>
            <th>Message</th>
          </tr>
          </thead>
          <tbody>
          <% if (messages == null || messages.isEmpty()) { %>
          <tr>
            <td colspan="3" class="text-center">No messages available.</td>
          </tr>
          <% } else {
            for (String message : messages) {
              String[] parts = message.split(",", 3);
              if (parts.length >= 3) {
                String timestamp = parts[0];
                String email = parts[1];
                String msg = parts[2];
          %>
          <tr>
            <td><%= timestamp %></td>
            <td><%= email %></td>
            <td><%= msg %></td>
          </tr>
          <% }
          }
          } %>
          </tbody>
        </table>

        <!-- Delete Messages Button -->
        <div class="mt-3">
          <a href="${pageContext.request.contextPath}/jsp/admin/DeleteMessages.jsp" class="btn btn-danger">Delete Messages</a>
        </div>
      </div>
    </div>
  </div>

  <div class="mt-3 text-center">
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Logout</a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>