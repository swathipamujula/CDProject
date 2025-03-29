<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    // Get the profile ID, name, and link from the form
    String profileIdStr = request.getParameter("profileId");
    String profileName = request.getParameter("profileName");
    String profileLink = request.getParameter("profileLink");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String message = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");

        // Check if the profile link already exists
        String checkSql = "SELECT COUNT(*) FROM user_profile WHERE PROFILE_LINK = ?";
        stmt = conn.prepareStatement(checkSql);
        stmt.setString(1, profileLink);
        rs = stmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        if (count > 0) {
            // Profile link already exists
            message = "Profile Link is already available";
        } else {
            // Determine if this is an insert or update operation
            if (profileIdStr == null || profileIdStr.isEmpty()) {
                // Insert a new profile
                String sql = "INSERT INTO user_profile (PROFILE_NAME, PROFILE_LINK) VALUES (?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, profileName);
                stmt.setString(2, profileLink);
                stmt.executeUpdate();
                message = "Profile Link Saved Successfully";
            } else {
                // Update an existing profile
                int profileId = Integer.parseInt(profileIdStr);
                String sql = "UPDATE user_profile SET PROFILE_NAME = ?, PROFILE_LINK = ? WHERE ID = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, profileName);
                stmt.setString(2, profileLink);
                stmt.setInt(3, profileId);
                stmt.executeUpdate();
                message = "Profile Link Updated Successfully";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

    // Set the message attribute
    request.setAttribute("message", message);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }
        .logout-button {
            margin-top: 20px;
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .logout-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <!-- Display the message -->
    <div class="message"><%= message %></div>

    <!-- Logout Button -->
    <a href="UserDashboard.jsp" class="logout-button">Logout</a>
</body>
</html>
