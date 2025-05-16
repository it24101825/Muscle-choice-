<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.dao.CourseDAO, java.util.List" %>
<html>
<head>
  <title>Admin Dashboard - Course Updates</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
  if (session.getAttribute("admin") == null) {
    response.sendRedirect("../AdminLogin.jsp");
    return;
  }
  CourseDAO courseDAO = new CourseDAO();
  List<String> courses = courseDAO.getAllCourses();
%>
<div class="container mt-5">
  <h2 class="text-center">Admin Dashboard</h2>

  <% if (request.getParameter("success") != null) { %>
  <div class="alert alert-success mt-3">Courses updated successfully!</div>
  <% } %>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-danger mt-3">Failed to update courses. Please try again.</div>
  <% } %>

  <!-- Tab Navigation -->
  <ul class="nav nav-tabs" id="adminTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminDashboard.jsp">Members</a>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="course-updates-tab" data-bs-toggle="tab" data-bs-target="#course-updates" type="button" role="tab" aria-controls="course-updates" aria-selected="true">Course Updates</button>
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
  </ul>

  <!-- Tab Content -->
  <div class="tab-content" id="adminTabsContent">
    <!-- Course Updates -->
    <div class="tab-pane fade show active" id="course-updates" role="tabpanel" aria-labelledby="course-updates-tab">
      <div class="mt-4">
        <h3>Update Courses</h3>
        <form action="${pageContext.request.contextPath}/updateCourses" method="post" class="mt-3">
          <div class="mb-3">
            <label for="courses" class="form-label">Enter Courses (one per line: name,date,time)</label>
            <textarea class="form-control" id="courses" name="courses" rows="5"><%= String.join("\n", courses) %></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Update Courses</button>
        </form>
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