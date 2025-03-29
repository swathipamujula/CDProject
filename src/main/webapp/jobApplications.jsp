<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Applications</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #002147;
        }
        .container {
            margin-top: 50px;
            max-width: 1000px;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4c2882; /* Set table header background color */
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Job Applications</h1>
        
        <%
            try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT job_id, name, skills, cgpa, backlogs, certifications FROM job_applications")) {
        %>
        
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>Job ID</th>
                    <th>Name</th>
                    <th>Skills</th>
                    <th>CGPA</th>
                    <th>Backlogs</th>
                    <th>Certifications</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("job_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("skills") %></td>
                    <td><%= rs.getDouble("cgpa") %></td>
                    <td><%= rs.getInt("backlogs") %></td>
                    <td><%= rs.getString("certifications") %></td>
                </tr>
                <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
