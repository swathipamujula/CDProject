<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<%
    String userEmail = (String) session.getAttribute("userEmail"); // Assume email is stored in session after login
    String userName = "User";

    if (userEmail != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");

            String sql = "SELECT NAME FROM users WHERE EMAIL = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            rs = stmt.executeQuery();

            if (rs.next()) {
                userName = rs.getString("NAME");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background-color: #ba55d3;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .card-body {
            padding: 30px;
            text-align: center;
        }
        .btn-primary {
            background-color: #ba55d3;
            border: none;
        }
        .btn-primary:hover {
            background-color: #9b3eb1;
        }
        .logout-btn {
            background-color: #ff5555;
            border: none;
            color: white;
            margin-top: 20px;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #ff3333;
        }
        .animate__animated {
            visibility: visible !important;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center animate__animated animate__fadeInDown">Welcome, <%= userName %>!</h2>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card animate__animated animate__fadeInUp animate__delay-1s">
                <div class="card-header text-center">
                    Create Profile
                </div>
                <div class="card-body">
                    <a href="createProfile.jsp" class="btn btn-primary btn-block">Go to Create Profile</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card animate__animated animate__fadeInUp animate__delay-2s">
                <div class="card-header text-center">
                    Apply for Job
                </div>
                <div class="card-body">
                    <a href="applyJob.jsp" class="btn btn-primary btn-block">Go to Apply for Job</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card animate__animated animate__fadeInUp animate__delay-3s">
                <div class="card-header text-center">
                    Create Resume
                </div>
                <div class="card-body">
                    <a href="upload.jsp" class="btn btn-primary btn-block">Upload Resume</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card animate__animated animate__fadeInUp animate__delay-4s">
                <div class="card-header text-center">
                    Profile Links
                </div>
                <div class="card-body">
                    <a href="socialMediaProfiles.jsp" class="btn btn-primary btn-block">Go to Profile Links</a>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center">
        <a href="LogoutServlet" class="btn logout-btn animate__animated animate__fadeInUp animate__delay-5s">Logout</a>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
