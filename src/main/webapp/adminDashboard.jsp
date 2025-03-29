<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #58427c;
            display: flex;
            min-height: 100vh;
            flex-direction: column;
            color: #fff; /* Default text color set to white */
        }
        .navbar {
            width: 250px;
            background: #002147;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 2rem;
            transition: width 0.3s;
        }
        .navbar a {
            color: #fff;
            padding: 1rem 2rem;
            text-decoration: none;
            text-align: center;
            width: 100%;
            transition: background 0.3s;
        }
        .navbar a:hover {
            background: #4c2882;
        }
        .navbar a.active {
            background: #4c2882;
        }
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background: #ff5555;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s;
            text-decoration: none;
        }
        .logout-btn:hover {
            background: #ff3333;
            transform: scale(1.1);
        }
        .container {
            margin-left: 250px;
            padding: 2rem;
            width: calc(100% - 250px);
            text-align: center;
            flex: 1;
        }
        .button-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .button {
            background: #333;
            color: #fff;
            padding: 1rem 2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 1rem;
            transition: transform 0.2s, background 0.2s;
            font-size: 1.1rem;
            text-decoration: none;
            display: inline-block;
        }
        .button:hover {
            background: #555;
            transform: scale(1.05);
        }
        .dashboard-background {
            background-image: url('dashboard-bg.jpg'); /* Add a nice background image */
            background-size: cover;
            background-position: center;
            padding: 2rem 0;
        }
        .statistic {
            font-size: 1.5rem;
            color: #fff; /* White text color for statistics */
            margin-top: 1rem;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff; /* White text color for header */
        }
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="adminDashboard.jsp" class="active">Dashboard</a>
        <a href="addJob.jsp">Add Job</a>
        <a href="userList.jsp">Registered Users</a>
        <a href="jobApplications.jsp">Job Applications</a>
    </div>
    <a href="LogoutServlet" class="logout-btn">Logout</a>
    <div class="container">
        <header>
            <h1>Welcome, Admin</h1>
        </header>
        <div class="dashboard-background">
            <div class="stats">
                <h2>Statistics</h2>
                <p class="statistic">Total Registered Users: <%= getTotalUsers() %></p>
                <p class="statistic">Total Job Applications: <%= getTotalJobApplications() %></p>
            </div>
        </div>
    </div>
</body>
</html>

<%!
    private int getTotalUsers() {
        int totalUsers = 0;
        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users")) {
            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalUsers;
    }

    private int getTotalJobApplications() {
        int totalApplications = 0;
        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM job_applications")) {
            if (rs.next()) {
                totalApplications = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalApplications;
    }
%>
