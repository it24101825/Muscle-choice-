<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gym Management System - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Navigation -->
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="jsp/public/About.jsp">About</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="jsp/public/Trainers.jsp">Trainers</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="jsp/public/Courses.jsp">Courses</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="jsp/public/Contact.jsp">Contact Us</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="jsp/public/Gallery.jsp">Gallery</a>
        </li>
    </ul>

    <!-- Home Content -->
    <div class="text-center mt-4">
        <a href="jsp/member/MemberRegistration.jsp" class="btn btn-primary m-2">Register as Member</a>
        <a href="jsp/member/MemberLogin.jsp" class="btn btn-primary m-2">Member Login</a>
        <div class="mt-3">
            <a href="jsp/admin/AdminLogin.jsp" class="link-secondary">Admin Login</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
