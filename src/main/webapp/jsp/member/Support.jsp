<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.model.Member" %>
<html>
<head>
    <title>Member - Support</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>
<%
    Member member = (Member) session.getAttribute("member");
    if (member == null) {
        response.sendRedirect("MemberLogin.jsp");
        return;
    }
%>
<div class="container mt-5">
    <ul class="nav nav-tabs" id="memberTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/MemberProfile.jsp">Profile Overview</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/GymUpdates.jsp">Gym Updates</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/AccountManagement.jsp">Account Management</a>
        </li>
    </ul>

    <div class="mt-3">
        <div class="card mb-4">
            <div class="card-header">
                <h3>Support</h3>
            </div>
            <div class="card-body">
                <p>For assistance, please contact us at:</p>
                <ul>
                    <li><strong>Email:</strong> skygymsupport@gmail.com</li>
                    <li><strong>Phone:</strong> 071-1121121</li>
                    <li><strong>Address:</strong><br>
                        Head Office<br>
                        136/5, S. De. S. Jayasinghe Mawatha,<br>
                        Nugegoda
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
