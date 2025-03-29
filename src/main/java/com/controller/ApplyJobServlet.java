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

@WebServlet("/applyJobServlet")
public class ApplyJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jobIdStr = request.getParameter("jobId");
        String userName = request.getParameter("userName");
        String skills = request.getParameter("skills");
        String cgpaStr = request.getParameter("cgpa");
        String backlogsStr = request.getParameter("backlogs");
        String certifications = request.getParameter("certifications");

        int jobId = 0;
        double cgpa = 0.0;
        int backlogs = 0;
        boolean isValid = true;

        // Validate and parse jobId
        if (jobIdStr != null && !jobIdStr.isEmpty()) {
            try {
                jobId = Integer.parseInt(jobIdStr);
            } catch (NumberFormatException e) {
                isValid = false;
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for Job ID");
            }
        } else {
            isValid = false;
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Job ID is required");
        }

        // Validate and parse cgpa
        if (cgpaStr != null && !cgpaStr.isEmpty()) {
            try {
                cgpa = Double.parseDouble(cgpaStr);
            } catch (NumberFormatException e) {
                isValid = false;
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for CGPA");
            }
        } else {
            isValid = false;
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "CGPA is required");
        }

        // Validate and parse backlogs
        if (backlogsStr != null && !backlogsStr.isEmpty()) {
            try {
                backlogs = Integer.parseInt(backlogsStr);
            } catch (NumberFormatException e) {
                isValid = false;
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for Backlogs");
            }
        } else {
            isValid = false;
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Backlogs are required");
        }

        // Proceed only if all inputs are valid
        if (!isValid) {
            return;
        }

        boolean isApplied = false;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
                 PreparedStatement stmt = conn.prepareStatement("INSERT INTO job_applications (job_id, name, skills, cgpa, backlogs, certifications) VALUES (?, ?, ?, ?, ?, ?)")) {

                stmt.setInt(1, jobId);
                stmt.setString(2, userName);
                stmt.setString(3, skills);
                stmt.setDouble(4, cgpa);
                stmt.setInt(5, backlogs);
                stmt.setString(6, certifications);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    isApplied = true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database Error: Unable to apply for job.");
            return;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Driver Error: JDBC driver not found.");
            return;
        }

        request.getRequestDispatcher("applyJob.jsp").forward(request, response);
    }
}
