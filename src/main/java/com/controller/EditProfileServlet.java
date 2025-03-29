package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.model.UserProfile;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String education = request.getParameter("education");
        String experience = request.getParameter("experience");
        String[] skillsArray = request.getParameterValues("skills");
        String skills = skillsArray != null ? String.join(", ", skillsArray) : "";
        String linkedin = request.getParameter("linkedin");
        String dob = request.getParameter("dob");

        double cgpa = 0;
        int backlogs = 0;
        int enrollmentYear = 0;
        int passoutYear = 0;

        // Handle number parsing with default values and error checking
        try {
            cgpa = Double.parseDouble(request.getParameter("cgpa"));
            if (cgpa < 0 || cgpa > 10) {
                throw new NumberFormatException("CGPA must be between 0 and 10");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid CGPA: " + e.getMessage());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;
        }

        try {
            backlogs = Integer.parseInt(request.getParameter("backlogs"));
            if (backlogs < 0) {
                throw new NumberFormatException("Backlogs cannot be negative");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Backlogs: " + e.getMessage());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;
        }

        try {
            enrollmentYear = Integer.parseInt(request.getParameter("enrollmentYear"));
            if (enrollmentYear < 1900 || enrollmentYear > 2099) {
                throw new NumberFormatException("Invalid Enrollment Year");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Enrollment Year: " + e.getMessage());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;
        }

        try {
            passoutYear = Integer.parseInt(request.getParameter("passoutYear"));
            if (passoutYear < 1900 || passoutYear > 2099) {
                throw new NumberFormatException("Invalid Passout Year");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid Passout Year: " + e.getMessage());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;
        }

        String sex = request.getParameter("sex");

        // Create UserProfile object with updated data
        UserProfile userProfile = new UserProfile();
        userProfile.setFullName(fullName);
        userProfile.setEmail(email);
        userProfile.setPhone(phone);
        userProfile.setAddress(address);
        userProfile.setEducation(education);
        userProfile.setExperience(experience);
        userProfile.setSkills(skills);
        userProfile.setLinkedIn(linkedin);
        userProfile.setDateOfBirth(dob);
        userProfile.setCgpa(cgpa);
        userProfile.setBacklogs(backlogs);
        userProfile.setEnrollmentYear(enrollmentYear);
        userProfile.setPassoutYear(passoutYear);
        userProfile.setSex(sex);

        // Update userProfile in session
        HttpSession session = request.getSession();
        session.setAttribute("userProfile", userProfile);

        // Redirect to profile view page
        response.sendRedirect("viewProfile.jsp");
    }
}
