package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.UserProfile;

@WebServlet("/CreateProfileServlet")
public class CreateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String education = request.getParameter("education");
        String experience = request.getParameter("experience");
        String skills = request.getParameter("skills");
        String linkedin = request.getParameter("linkedin");
        String dob = request.getParameter("dob");
        String cgpaStr = request.getParameter("cgpa");
        String backlogsStr = request.getParameter("backlogs");
        String enrollmentYearStr = request.getParameter("enrollmentYear");
        String passoutYearStr = request.getParameter("passoutYear");
        String sex = request.getParameter("sex");

        // Server-side validation
        boolean hasErrors = false;
        StringBuilder errorMessages = new StringBuilder();
        
        if (fullName == null || fullName.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Full Name is required. ");
        }
        if (email == null || email.isEmpty() || !email.contains("@")) {
            hasErrors = true;
            errorMessages.append("Valid Email is required. ");
        }
        if (phone == null || !phone.matches("\\d{10}")) {
            hasErrors = true;
            errorMessages.append("Phone number must be 10 digits. ");
        }
        if (address == null || address.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Address is required. ");
        }
        if (education == null || education.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Education is required. ");
        }
        if (experience == null || experience.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Experience is required. ");
        }
        if (skills == null || skills.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Skills are required. ");
        }
        if (linkedin == null || linkedin.isEmpty()) {
            hasErrors = true;
            errorMessages.append("LinkedIn Profile is required. ");
        }
        if (dob == null || dob.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Date of Birth is required. ");
        }
        double cgpa = 0;
        if (cgpaStr == null || cgpaStr.isEmpty()) {
            hasErrors = true;
            errorMessages.append("CGPA is required. ");
        } else {
            try {
                cgpa = Double.parseDouble(cgpaStr);
                if (cgpa < 0 || cgpa > 10) {
                    hasErrors = true;
                    errorMessages.append("CGPA must be between 0 and 10. ");
                }
            } catch (NumberFormatException e) {
                hasErrors = true;
                errorMessages.append("CGPA must be a number. ");
            }
        }
        int backlogs = 0;
        if (backlogsStr == null || backlogsStr.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Backlogs count is required. ");
        } else {
            try {
                backlogs = Integer.parseInt(backlogsStr);
                if (backlogs < 0) {
                    hasErrors = true;
                    errorMessages.append("Backlogs cannot be negative. ");
                }
            } catch (NumberFormatException e) {
                hasErrors = true;
                errorMessages.append("Backlogs must be a number. ");
            }
        }
        int enrollmentYear = 0;
        if (enrollmentYearStr == null || enrollmentYearStr.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Enrollment Year is required. ");
        } else {
            try {
                enrollmentYear = Integer.parseInt(enrollmentYearStr);
                if (enrollmentYear < 1900 || enrollmentYear > 2099) {
                    hasErrors = true;
                    errorMessages.append("Enrollment Year must be valid. ");
                }
            } catch (NumberFormatException e) {
                hasErrors = true;
                errorMessages.append("Enrollment Year must be a number. ");
            }
        }
        int passoutYear = 0;
        if (passoutYearStr == null || passoutYearStr.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Passout Year is required. ");
        } else {
            try {
                passoutYear = Integer.parseInt(passoutYearStr);
                if (passoutYear < 1900 || passoutYear > 2099) {
                    hasErrors = true;
                    errorMessages.append("Passout Year must be valid. ");
                }
            } catch (NumberFormatException e) {
                hasErrors = true;
                errorMessages.append("Passout Year must be a number. ");
            }
        }
        if (sex == null || sex.isEmpty()) {
            hasErrors = true;
            errorMessages.append("Sex is required. ");
        }

        if (hasErrors) {
            request.setAttribute("errorMessage", errorMessages.toString());
            request.getRequestDispatcher("createProfile.jsp").forward(request, response);
            return;
        }

        // Store the profile information in the session
        request.getSession().setAttribute("userProfile", new UserProfile(fullName, email, phone, address, education, experience, skills, linkedin, dob, cgpa, backlogs, enrollmentYear, passoutYear, sex));

        // Redirect to a confirmation page
        response.sendRedirect("profileCreated.jsp");
    }
}
