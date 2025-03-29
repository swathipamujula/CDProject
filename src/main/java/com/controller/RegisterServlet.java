package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection settings
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "system";
    private static final String DB_PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (name != null && email != null && password != null && confirmPassword != null && password.equals(confirmPassword)) {
            Connection conn = null;
            PreparedStatement checkStmt = null;
            PreparedStatement insertStmt = null;
            ResultSet rs = null;

            try {
                // Load Oracle JDBC Driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish database connection
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // Check if user already exists
                String checkSql = "SELECT * FROM users WHERE email = ?";
                checkStmt = conn.prepareStatement(checkSql);
                checkStmt.setString(1, email);
                rs = checkStmt.executeQuery();

                if (rs.next()) {
                    // Email already exists, redirect with error
                    response.sendRedirect("register.jsp?error=Account%20already%20exists");
                } else {
                    // Insert new user into database
                    String insertSql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                    insertStmt = conn.prepareStatement(insertSql);
                    insertStmt.setString(1, name);
                    insertStmt.setString(2, email);
                    insertStmt.setString(3, password);

                    int rowsInserted = insertStmt.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("userLogin.jsp");
                    } else {
                        response.sendRedirect("register.jsp?error=Registration%20failed");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("register.jsp?error=Database%20error");
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (checkStmt != null) checkStmt.close();
                    if (insertStmt != null) insertStmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("register.jsp?error=Passwords%20do%20not%20match");
        }
    }
}
