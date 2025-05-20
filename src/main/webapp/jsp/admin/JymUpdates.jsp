<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.messageManagement.dao.JymUpdateDAO, java.util.List" %>
<html>
<head>
  <title>Admin Dashboard - Jym Updates</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
  <style>
    .nav-tabs-wrapper {
      overflow-x: auto;
      white-space: nowrap;
    }
    .nav-tabs .nav-link {
      white-space: nowrap;
    }
  </style>
</head>
<body>
<%
  if (session.getAttribute("admin") == null) {
    response.sendRedirect("../AdminLogin.jsp");
    return;
  }

  List<String> updates = null;
  try {
    JymUpdateDAO jymUpdateDAO = new JymUpdateDAO();
    updates = jymUpdateDAO.getAllUpdates();
  } catch (Exception e) {
    updates = null;
  }
%>
<div class="container mt-5">
  <h2 class="text-center">Admin Dashboard</h2>

  <% if (request.getParameter("success") != null) { %>
  <div class="alert alert-success mt-3">Jym update added successfully!</div>
  <% } %>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-danger mt-3">Failed to add jym update. Please try again.</div>
  <% } %>
  <% if (request.getParameter("deleteSuccess") != null) { %>
  <div class="alert alert-success mt-3">Jym update deleted successfully!</div>
  <% } %>

  <!-- Tab Navigation -->
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
        <button class="nav-link active" id="jym-updates-tab" data-bs-toggle="tab" data-bs-target="#jym-updates" type="button" role="tab" aria-controls="jym-updates" aria-selected="true">Jym Updates</button>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminUploadImage.jsp">Gallery</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminRenewalApproval.jsp">Renew requests</a>
      </li>
    </ul>
  </div>

  <!-- Tab Content -->
  <div class="tab-content" id="adminTabsContent">
    <!-- Jym Updates -->
    <div class="tab-pane fade show active" id="jym-updates" role="tabpanel" aria-labelledby="jym-updates-tab">
      <div class="mt-4">
        <h3>Add Jym Update</h3>
        <form action="${pageContext.request.contextPath}/addJymUpdate" method="post" class="mt-3">
          <div class="mb-3">
            <label for="updateMessage" class="form-label">Update Message</label>
            <textarea class="form-control" id="updateMessage" name="updateMessage" rows="3" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Add Update</button>
        </form>

        <h3 class="mt-4">Existing Updates</h3>
        <% if (updates == null || updates.isEmpty()) { %>
        <p>No updates available.</p>
        <% } else { %>
        <ul class="list-group mt-3">
          <% for (String update : updates) { %>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            <%= update %>
            <form action="${pageContext.request.contextPath}/deleteJymUpdate" method="post" style="display:inline;">
              <input type="hidden" name="updateToDelete" value="<%= update %>">
              <button type="submit" class="btn btn-danger btn-sm">Delete</button>
            </form>
          </li>
          <% } %>
        </ul>
        <% } %>
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
