<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.UserProfile" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
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
    </style>
    <script>
        // Client-side validation
        function validateForm() {
            const fields = ['fullName', 'email', 'phone', 'address', 'education', 'experience', 'skills', 'linkedin', 'dob', 'cgpa', 'backlogs', 'enrollmentYear', 'passoutYear', 'sex'];
            for (let field of fields) {
                if (document.forms["profileForm"][field].value === "") {
                    alert(field + " must be filled out.");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Your Profile</h2>
        <form name="profileForm" action="EditProfileServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" value="<%= ((UserProfile)session.getAttribute("userProfile")).getFullName() %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= ((UserProfile)session.getAttribute("userProfile")).getEmail() %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= ((UserProfile)session.getAttribute("userProfile")).getPhone() %>" pattern="[0-9]{10}" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= ((UserProfile)session.getAttribute("userProfile")).getAddress() %>" required>
            </div>
            <div class="form-group">
                <label for="education">Education</label>
                <input type="text" class="form-control" id="education" name="education" value="<%= ((UserProfile)session.getAttribute("userProfile")).getEducation() %>" required>
            </div>
            <div class="form-group">
                <label for="experience">Professional Experience</label>
                <textarea class="form-control" id="experience" name="experience" rows="4" required><%= ((UserProfile)session.getAttribute("userProfile")).getExperience() %></textarea>
            </div>
            <div class="form-group">
                <label for="skills">Skills</label>
                <select multiple class="form-control" id="skills" name="skills" required>
                    <option value="C" <%= ((UserProfile)session.getAttribute("userProfile")).getSkills().contains("C") ? "selected" : "" %>>C</option>
                    <option value="Java" <%= ((UserProfile)session.getAttribute("userProfile")).getSkills().contains("Java") ? "selected" : "" %>>Java</option>
                    <option value="Python" <%= ((UserProfile)session.getAttribute("userProfile")).getSkills().contains("Python") ? "selected" : "" %>>Python</option>
                    <option value="HTML" <%= ((UserProfile)session.getAttribute("userProfile")).getSkills().contains("HTML") ? "selected" : "" %>>HTML</option>
                    <option value="CSS" <%= ((UserProfile)session.getAttribute("userProfile")).getSkills().contains("CSS") ? "selected" : "" %>>CSS</option>
                    <option value="JavaScript" <%= ((UserProfile)session.getAttribute("userProfile")).getSkills().contains("JavaScript") ? "selected" : "" %>>JavaScript</option>
                </select>
            </div>
            <div class="form-group">
                <label for="linkedin">LinkedIn Profile</label>
                <input type="url" class="form-control" id="linkedin" name="linkedin" value="<%= ((UserProfile)session.getAttribute("userProfile")).getLinkedIn() %>" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" value="<%= ((UserProfile)session.getAttribute("userProfile")).getDateOfBirth() %>" required>
            </div>
            <div class="form-group">
                <label for="cgpa">Current CGPA</label>
                <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" value="<%= ((UserProfile)session.getAttribute("userProfile")).getCgpa() %>" min="0" max="10" required>
            </div>
            <div class="form-group">
                <label for="backlogs">Backlogs</label>
                <input type="number" class="form-control" id="backlogs" name="backlogs" value="<%= ((UserProfile)session.getAttribute("userProfile")).getBacklogs() %>" min="0" required>
            </div>
            <div class="form-group">
                <label for="enrollmentYear">Enrollment Year</label>
                <input type="number" class="form-control" id="enrollmentYear" name="enrollmentYear" value="<%= ((UserProfile)session.getAttribute("userProfile")).getEnrollmentYear() %>" min="1900" max="2099" required>
            </div>
            <div class="form-group">
                <label for="passoutYear">Passout Year</label>
                <input type="number" class="form-control" id="passoutYear" name="passoutYear" value="<%= ((UserProfile)session.getAttribute("userProfile")).getPassoutYear() %>" min="1900" max="2099" required>
            </div>
            <div class="form-group">
                <label for="sex">Sex</label>
                <select class="form-control" id="sex" name="sex" required>
                    <option value="">Select Sex</option>
                    <option value="Male" <%= "Male".equals(((UserProfile)session.getAttribute("userProfile")).getSex()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(((UserProfile)session.getAttribute("userProfile")).getSex()) ? "selected" : "" %>>Female</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
         
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
