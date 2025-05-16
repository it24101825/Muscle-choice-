<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.model.Admin" %>
<html>
<head>
    <title>Admin - Upload Image</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
    // Check for admin session
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("../AdminLogin.jsp");
        return;
    }
%>
<div class="container mt-5">
    <h2 class="text-center">Admin - Upload Gym Image</h2>
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success mt-3">Image uploaded successfully!</div>
    <% } %>
    <% if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger mt-3">Failed to upload image. Please try again.</div>
    <% } %>

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
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/Messages.jsp">Messages</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/JymUpdates.jsp">Jym Updates</a>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="Gallery-tab" data-bs-toggle="tab" data-bs-target="#Gallery" type="button" role="tab" aria-controls="Gallery" aria-selected="true">Gallery</button>
        </li>
    </ul>

    <div class="card mb-4">
        <div class="card-header">
            <h3>Upload Image</h3>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/uploadImage" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="image" class="form-label">Select Image</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/jpeg,image/png,image/jpg" required>
                </div>
                <button type="submit" class="btn btn-primary">Upload</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>