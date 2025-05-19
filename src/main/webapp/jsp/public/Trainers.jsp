<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.trainerManagement.dao.TrainerDAO, java.util.List" %>
<html>
<head>
  <title>Gym Management System - Trainers</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css?v=1.0" rel="stylesheet">
</head>
<body>
<%
  TrainerDAO trainerDAO = new TrainerDAO();
  List<String> trainers = trainerDAO.getAllTrainers();
%>
<div class="container mt-5">
  <!-- Navigation -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/public/About.jsp">About</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="${pageContext.request.contextPath}/jsp/public/Trainers.jsp">Trainers</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/public/Courses.jsp">Courses</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/public/Contact.jsp">Contact Us</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Gallery.jsp">Gallery</a>
    </li>
  </ul>

  <!-- Trainers Content -->
  <h2 class="text-center mt-4">Our Trainers</h2>
  <%
    if (trainers == null || trainers.isEmpty()) {
  %>
  <p class="mt-3 text-center">No trainers available at the moment.</p>
  <%
  } else {
    for (String trainer : trainers) {
      String[] parts = trainer.split(",");
      if (parts.length >= 3) {
        String name = parts[0];
        String specialization = parts[1];
        String contact = parts[2];
  %>
  <div class="mt-3">
    <h4><%= name %></h4>
    <p>Specialization: <%= specialization %><br>Contact: <%= contact %></p>
  </div>
  <%
        }
      }
    }
  %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>