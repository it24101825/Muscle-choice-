<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.courseManagement.dao.CourseDAO, java.util.List" %>
<html>
<head>
    <title>Jym Management System - Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/styles.css?v=1.0" rel="stylesheet">
</head>
<body>
<%
    List<String> courses = null;
    try {
        CourseDAO courseDAO = new CourseDAO();
        courses = courseDAO.getAllCourses();
    } catch (Exception e) {
        courses = null; // Fail-safe fallback
    }
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
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/public/Trainers.jsp">Trainers</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="${pageContext.request.contextPath}/jsp/public/Courses.jsp">Courses</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/public/Contact.jsp">Contact Us</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Gallery.jsp">Gallery</a>
        </li>
    </ul>

    <!-- Courses Content -->
    <h2 class="text-center mt-4">Available Courses</h2>
    <ul class="mt-3">
        <%
            if (courses == null || courses.isEmpty()) {
        %>
        <li>No courses available at the moment.</li>
        <%
        } else {
            for (String course : courses) {
                String[] parts = course.split(",");
                if (parts.length >= 3) {
                    String name = parts[0].trim();
                    String date = parts[1].trim();
                    String time = parts[2].trim();
        %>
        <li><%= name %> - <%= date %>, <%= time %></li>
        <%
                    }
                }
            }
        %>
    </ul>
    <p class="mt-3">Register for any course by contacting our support team!</p>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>