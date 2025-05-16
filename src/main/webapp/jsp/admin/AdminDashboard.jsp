<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.dao.MemberDAO, com.jym.model.Member, java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<html>
<head>
  <title>Admin Dashboard - Members</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
  if (session.getAttribute("admin") == null) {
    response.sendRedirect("../AdminLogin.jsp");
    return;
  }
  MemberDAO memberDAO = new MemberDAO();
  List<Member> members = memberDAO.getAllMembers();
%>
<div class="container mt-5">
  <h2 class="text-center">Admin Dashboard</h2>

  <!-- Tab Navigation -->
  <ul class="nav nav-tabs" id="adminTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="members-tab" data-bs-toggle="tab" data-bs-target="#members" type="button" role="tab" aria-controls="members" aria-selected="true">Members</button>
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
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/AdminUploadImage.jsp">Gallery</a>
    </li>
  </ul>

  <!-- Tab Content -->
  <div class="tab-content" id="adminTabsContent">
    <!-- Members -->
    <div class="tab-pane fade show active" id="members" role="tabpanel" aria-labelledby="members-tab">
      <div class="mt-4">
        <h3>Registered Members</h3>
        <table class="table">
          <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Join Date</th>
          </tr>
          </thead>
          <tbody>
          <% for (Member member : members) { %>
          <tr>
            <td><%= member.getId() %></td>
            <td><%= member.getName() %></td>
            <td><%= member.getEmail() %></td>
            <td><%= member.getJoinDate() %></td>
          </tr>
          <% } %>
          </tbody>
        </table>
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