<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/styles.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Member Login</h2>
    <form action="../../loginMember" method="post" class="mt-4">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger mt-3">Invalid email or password.</div>
    <% } %>
    <div class="mt-3">
        <a href="../../index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>