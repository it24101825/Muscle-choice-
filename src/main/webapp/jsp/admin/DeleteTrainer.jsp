<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.dao.TrainerDAO, java.util.List" %>
<html>
<head>
  <title>Delete Trainer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
  if (session.getAttribute("admin") == null) {
    response.sendRedirect("../AdminLogin.jsp");
    return;
  }
  TrainerDAO trainerDAO = new TrainerDAO();
  List<String> trainers = trainerDAO.getAllTrainers();
%>
<div class="container mt-5">
  <h2 class="text-center">Delete Trainer</h2>

  <% if (request.getParameter("deleteSuccess") != null) { %>
  <div class="alert alert-success mt-3">Trainer deleted successfully!</div>
  <% } %>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-danger mt-3">Failed to delete trainer. Please try again.</div>
  <% } %>

  <!-- Trainers Table -->
  <div class="mt-4">
    <h3>Existing Trainers</h3>
    <% if (trainers == null || trainers.isEmpty()) { %>
    <p>No trainers available.</p>
    <% } else { %>
    <table class="table table-bordered">
      <thead>
      <tr>
        <th>Name</th>
        <th>Specialization</th>
        <th>Contact</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <% for (String trainer : trainers) {
        String[] parts = trainer.split(",");
        if (parts.length >= 3) {
          String name = parts[0].trim();
          String specialization = parts[1].trim();
          String contact = parts[2].trim();
      %>
      <tr>
        <td><%= name %></td>
        <td><%= specialization %></td>
        <td><%= contact %></td>
        <td>
          <form action="${pageContext.request.contextPath}/deleteTrainer" method="post" style="display:inline;">
            <input type="hidden" name="trainerToDelete" value="<%= trainer %>">
            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
          </form>
        </td>
      </tr>
      <% } } %>
      </tbody>
    </table>
    <% } %>
  </div>

  <div class="mt-3 text-center">
    <a href="${pageContext.request.contextPath}/jsp/admin/Trainers.jsp" class="btn btn-secondary">Back to Trainers</a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>