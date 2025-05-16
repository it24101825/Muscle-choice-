<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.dao.MessageDAO, java.util.List" %>
<html>
<head>
  <title>Delete Messages</title>
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
  <h2 class="text-center">Delete Messages</h2>

  <% if (request.getParameter("deleteSuccess") != null) { %>
  <div class="alert alert-success mt-3">Message deleted successfully!</div>
  <% } %>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-danger mt-3">Failed to delete message. Please try again.</div>
  <% } %>

  <!-- Messages Table -->
  <div class="mt-4">
    <h3>Existing Messages</h3>
    <% if (messages == null || messages.isEmpty()) { %>
    <p>No messages available.</p>
    <% } else { %>
    <table class="table table-bordered">
      <thead>
      <tr>
        <th>Timestamp</th>
        <th>Email</th>
        <th>Message</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <% for (String message : messages) {
        String[] parts = message.split(",", 3);
        if (parts.length >= 3) {
          String timestamp = parts[0].trim();
          String email = parts[1].trim();
          String msg = parts[2].trim();
      %>
      <tr>
        <td><%= timestamp %></td>
        <td><%= email %></td>
        <td><%= msg %></td>
        <td>
          <form action="${pageContext.request.contextPath}/deleteMessage" method="post" style="display:inline;">
            <input type="hidden" name="messageToDelete" value="<%= message %>">
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
    <a href="${pageContext.request.contextPath}/jsp/admin/Messages.jsp" class="btn btn-secondary">Back to Messages</a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>