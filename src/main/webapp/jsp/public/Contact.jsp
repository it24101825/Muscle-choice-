<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gym Management System - Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/styles.css?v=1.0" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Navigation -->
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="../../index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="About.jsp">About</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Trainers.jsp">Trainers</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Courses.jsp">Courses</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="Contact.jsp">Contact Us</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Gallery.jsp">Gallery</a>
        </li>
    </ul>

    <!-- Contact Content -->
    <h2 class="text-center mt-4">Contact Us</h2>
    <p class="mt-3">Email: support@gym.com</p>
    <p>Phone: (555) 123-4567</p>
    <p>Address: 123 Fitness Lane, Fit City, FC 12345</p>
    <p>Business Hours: Mon-Fri 6:00 AM - 9:00 PM, Sat-Sun 8:00 AM - 6:00 PM</p>

    <!-- Contact Form -->
    <h3 class="mt-4">Send Us a Message</h3>
    <form action="../../submitContact" method="post" class="mt-3">
        <div class="mb-3">
            <label for="contactEmail" class="form-label">Your Email</label>
            <input type="email" class="form-control" id="contactEmail" name="email" required>
        </div>
        <div class="mb-3">
            <label for="contactMessage" class="form-label">Your Message</label>
            <textarea class="form-control" id="contactMessage" name="message" rows="4" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Send Message</button>
    </form>
    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success mt-3">Your message has been sent successfully!</div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger mt-3">Failed to send message. Please try again.</div>
    <% } %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>