<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Users</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #002147;
        }
        .container {
            margin-top: 50px;
            max-width: 800px;
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
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Registered Users</h1>
        
        <%
            int totalUsers = 0;
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
                
                // Create a scrollable ResultSet
                stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                rs = stmt.executeQuery("SELECT name, email, password FROM users");
                
                // Count total users
                if (rs.last()) {
                    totalUsers = rs.getRow();
                    rs.beforeFirst(); // Reset to the beginning
                }
        %>
        
        <div class="alert alert-info" role="alert">
            Total Registered Users: <%= totalUsers %>
        </div>
        
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("password") %></td>
                </tr>
                <%
                    }
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Database error: " + e.getMessage() + "</div>");
                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger'>Driver error: " + e.getMessage() + "</div>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
