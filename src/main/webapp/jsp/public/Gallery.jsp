<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Member, java.io.File" %>
<html>
<head>
  <title>Gym Management System - Gallery</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/styles.css?v=1.0" rel="stylesheet">
  <style>
    .gallery-card {
      transition: transform 0.3s ease;
    }
    .gallery-card:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .gallery-img {
      height: 300px;
      width: 100%;
      object-fit: cover;
    }
    .modal-img {
      max-height: 80vh;
      width: auto;
      margin: auto;
    }
  </style>
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
      <a class="nav-link" href="Contact.jsp">Contact Us</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="Gallery.jsp">Gallery</a>
    </li>
  </ul>

  <!-- Gallery Content -->
  <h2 class="text-center mt-4">Gallery</h2>
  <div class="mt-3">
    <div class="card mb-4">
      <div class="card-header">
        <h3>Gym Images</h3>
      </div>
      <div class="card-body">
        <div class="row row-cols-1 row-cols-md-3 g-4">
          <%
            String imageDir = "D:\\java\\untitled\\data\\images";
            File dir = new File(imageDir);
            if (dir.exists() && dir.isDirectory()) {
              File[] files = dir.listFiles((d, name) -> name.endsWith(".jpg") || name.endsWith(".png") || name.endsWith(".jpeg"));
              if (files != null && files.length > 0) {
                for (File file : files) {
                  String imageName = file.getName();
                  String imageUrl = request.getContextPath() + "/image?name=" + java.net.URLEncoder.encode(imageName, "UTF-8");
          %>
          <div class="col">
            <div class="card gallery-card h-100">
              <img src="<%= imageUrl %>" class="card-img-top gallery-img" alt="Gym Image" data-bs-toggle="modal" data-bs-target="#imageModal" data-src="<%= imageUrl %>">
            </div>
          </div>
          <%
            }
          } else {
          %>
          <p class="text-center">Images are not available</p>
          <%
            }
          } else {
          %>
          <p class="text-center">Image directory not found</p>
          <%
            }
          %>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Image Preview -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <img src="" class="modal-img" id="modalImage" alt="Gym Image">
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const imageModal = document.getElementById('imageModal');
    imageModal.addEventListener('show.bs.modal', (event) => {
      const img = event.relatedTarget;
      const src = img.getAttribute('data-src');
      const modalImg = document.getElementById('modalImage');
      modalImg.src = src;
    });
  });
</script>
</body>
</html>