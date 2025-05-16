<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.dao.TrainerDAO, java.util.List" %>
<html>
<head>
    <title>Admin Dashboard - Trainers</title>
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
    <h2 class="text-center">Admin Dashboard</h2>

    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success mt-3">Trainer added successfully!</div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger mt-3">Failed to add trainer. Please try again.</div>
    <% } %>

    <!-- Tab Navigation -->
    <ul class="nav nav-tabs" id="adminTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminDashboard.jsp">Members</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/CourseUpdates.jsp">Course Updates</a>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="trainers-tab" data-bs-toggle="tab" data-bs-target="#trainers" type="button" role="tab" aria-controls="trainers" aria-selected="true">Trainers</button>
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
        <!-- Trainers -->
        <div class="tab-pane fade show active" id="trainers" role="tabpanel" aria-labelledby="trainers-tab">
            <div class="mt-4">
                <h3>Add Trainer</h3>

                <!-- Add Trainer Form -->
                <form action="${pageContext.request.contextPath}/addTrainer" method="post" class="mt-3">
                    <div class="mb-3">
                        <label for="trainerName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="trainerName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="trainerSpecialization" class="form-label">Specialization</label>
                        <input type="text" class="form-control" id="trainerSpecialization" name="specialization" required>
                    </div>
                    <div class="mb-3">
                        <label for="trainerContact" class="form-label">Contact (email|phone)</label>
                        <input type="text" class="form-control" id="trainerContact" name="contact" required>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">Add Trainer</button>
                    </div>
                </form>

                <!-- Delete Trainer Form -->
                <form action="${pageContext.request.contextPath}/jsp/admin/DeleteTrainer.jsp" method="post" class="mt-3">
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-danger">Delete Trainer</button>
                    </div>
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
