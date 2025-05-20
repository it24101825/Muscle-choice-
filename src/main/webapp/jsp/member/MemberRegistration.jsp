<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Member Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/styles.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center">Member Registration</h2>
  <form action="../../registerMember" method="post" class="mt-4">
    <div class="mb-3">
      <label for="name" class="form-label">Name</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <div class="mb-3">
      <label for="membershipType" class="form-label">Membership Type</label>
      <select class="form-control" id="membershipType" name="membershipType" required>
        <option value="Basic">Basic</option>
        <option value="Premium">Premium</option>
        <option value="VIP">VIP</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Register</button>
  </form>
  <% if (request.getParameter("success") != null) { %>
  <div class="alert alert-success mt-3">Registration successful! Please <a href="MemberLogin.jsp">login</a>.</div>
  <% } %>
  <% if (request.getParameter("error") != null) { %>
  <div class="alert alert-danger mt-3">Email already exists. Please use a different email.</div>
  <% } %>
  <div class="mt-3">
    <a href="../../index.jsp" class="btn btn-secondary">Back to Home</a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>