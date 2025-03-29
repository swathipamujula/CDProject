<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.UserProfile" %> <!-- Import the UserProfile class -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Profile</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #ba55d3;
            border-color: #ba55d3;
            color: white;
        }
        .btn-custom:hover {
            background-color: #9b3eb1;
            border-color: #9b3eb1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Profile Created Successfully</h2>
        <table class="table table-bordered">
            <tr>
                <th>Full Name</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getFullName() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getEmail() %></td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getPhone() %></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getAddress() %></td>
            </tr>
            <tr>
                <th>Education</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getEducation() %></td>
            </tr>
            <tr>
                <th>Experience</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getExperience() %></td>
            </tr>
            <tr>
                <th>Skills</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getSkills() %></td>
            </tr>
            <tr>
                <th>LinkedIn Profile</th>
                <td><a href="<%= ((UserProfile)session.getAttribute("userProfile")).getLinkedIn() %>" target="_blank">LinkedIn Profile</a></td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getDateOfBirth() %></td>
            </tr>
            <tr>
                <th>Current CGPA</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getCgpa() %></td>
            </tr>
            <tr>
                <th>Backlogs</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getBacklogs() %></td>
            </tr>
            <tr>
                <th>Enrollment Year</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getEnrollmentYear() %></td>
            </tr>
            <tr>
                <th>Passout Year</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getPassoutYear() %></td>
            </tr>
            <tr>
                <th>Sex</th>
                <td><%= ((UserProfile)session.getAttribute("userProfile")).getSex() %></td>
            </tr>
        </table>
        <a href="editProfile.jsp" class="btn btn-custom">Edit Profile</a>
        <a href="UserDashboard.jsp" class="btn btn-secondary ml-2">Go to Dashboard</a>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
