package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addJobServlet")
public class AddJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jobTitle = request.getParameter("jobTitle");
        String jobDescription = request.getParameter("jobDescription");
        String companyIdStr = request.getParameter("companyId");
        String companyName = request.getParameter("companyName");

        int companyId;
        try {
            companyId = Integer.parseInt(companyIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Company ID");
            return;
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO jobs (title, description, company_id, company_name) VALUES (?, ?, ?, ?)")) {

                stmt.setString(1, jobTitle);
                stmt.setString(2, jobDescription);
                stmt.setInt(3, companyId);
                stmt.setString(4, companyName);
                stmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database Error: Unable to add job.");
            return;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Driver Error: JDBC driver not found.");
            return;
        }

        // Redirect to the user dashboard or apply job page
        response.sendRedirect("applyJob.jsp");
        
    }
}

