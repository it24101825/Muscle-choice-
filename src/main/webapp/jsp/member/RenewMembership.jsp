<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jym.userManagement.model.Member" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Member Profile & Renewal</title>
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
    LocalDate expiryDate = member.getLastRenewal().plusYears(1); // Assuming 1-year membership
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String status = request.getParameter("status");
    String sessionStatus = (String) session.getAttribute("renewalStatus");
    if ("succeeded".equals(sessionStatus)) {
        session.removeAttribute("renewalStatus");
    }
%>

<div class="container mt-5">

    <!-- Status Message -->
    <% if ("pending".equals(status) || "pending".equals(sessionStatus)) { %>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        Your membership renewal is pending approval. Please wait for admin confirmation.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } else if ("succeeded".equals(sessionStatus)) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Membership renewal succeeded! Your new expiry date is updated.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <!-- Tab Navigation -->
    <ul class="nav nav-tabs" id="memberTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link active" href="${pageContext.request.contextPath}/jsp/member/MemberProfile.jsp">Profile Overview</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/GymUpdates.jsp">Gym Updates</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" href="${pageContext.request.contextPath}/jsp/member/AccountManagement.jsp">Account Management</a>
        </li>
    </ul>

    <div class="mt-3">
        <!-- Renew Membership Section -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Renew Your Membership</h3>
            </div>
            <div class="card-body">
                <h4 class="card-title">Member Details</h4>
                <p><strong>Name:</strong> <%= member.getName() %></p>
                <p><strong>Member ID:</strong> <%= member.getId() %></p>
                <p><strong>Current Membership Type:</strong> <%= member.getMembershipType() %></p>
                <p><strong>Current Expiry Date:</strong> <%= expiryDate.format(formatter) %></p>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header">
                <h3>Select Renewal Duration and Payment Details</h3>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/renewMembership" method="post" onsubmit="return validateForm()">
                    <div class="mb-3">
                        <label for="renewalDuration" class="form-label">Renewal Duration:</label>
                        <select class="form-select" id="renewalDuration" name="renewalDuration" required>
                            <option value="" disabled selected>Select duration</option>
                            <option value="30">30 Days</option>
                            <option value="60">60 Days</option>
                            <option value="90">90 Days</option>
                            <option value="365">1 Year</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="bank" class="form-label">Select Bank:</label>
                        <select class="form-select" id="bank" name="bank" required>
                            <option value="" disabled selected>Select bank</option>
                            <option value="Peoples Bank">People's Bank</option>
                            <option value="BOC">BOC</option>
                            <option value="Sampath Bank">Sampath Bank</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="transactionId" class="form-label">Transaction ID (8 or more digits):</label>
                        <input type="text" class="form-control" id="transactionId" name="transactionId" pattern="[0-9]{8,}" required>
                        <div class="invalid-feedback">
                            Transaction ID must be 8 or more digits.
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Confirm Renewal</button>
                    <a href="${pageContext.request.contextPath}/jsp/member/MemberProfile.jsp" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>

        <!-- Member Profile Overview -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Membership Status</h3>
            </div>
            <div class="card-body">
                <p><strong>Plan Type:</strong> <%= member.getMembershipType() %></p>
                <p><strong>Next Billing Date:</strong> <%= expiryDate.format(formatter) %></p>
                <p><strong>Payment History:</strong></p>
                <ul>
                    <li>Payment on <%= member.getLastRenewal().format(formatter) %> - <%= member.getMembershipType() %> Plan</li>
                    <!-- Add more payment history here if available -->
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function validateForm() {
        const transactionId = document.getElementById("transactionId").value;
        const transactionIdPattern = /^[0-9]{8,}$/;
        if (!transactionIdPattern.test(transactionId)) {
            document.getElementById("transactionId").classList.add("is-invalid");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
