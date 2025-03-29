<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    // Retrieve submitted form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String subject = request.getParameter("subject");

    // Create a contact info string
    String contactInfo = "Name: " + name + ", Email: " + email + ", Phone: " + phone + ", Subject: " + subject;

    // Retrieve or create the contact list in the session
    List<String> contactList = (List<String>) session.getAttribute("contactList");
    if (contactList == null) {
        contactList = new ArrayList<>();
    }

    // Add the new contact info to the list
    contactList.add(contactInfo);

    // Store the updated list back in the session
    session.setAttribute("contactList", contactList);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Form Submission</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #002147;
            position: relative;
            min-height: 100vh;
        }
        .container {
            margin-top: 100px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
    </style>
    <script>
        // Display success message
        function showSuccessMessage() {
            alert("Form submitted successfully!");
        }
    </script>
</head>
<body onload="showSuccessMessage()">
    <a href="UserDashboard.jsp" class="logout-btn">Logout</a>
    <div class="container">
        <h1 class="text-center">Thank You for Contacting Us!</h1>
        <p class="text-center">Your information has been submitted.</p>
        <h3 class="text-center mt-4">Submitted Contacts:</h3>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <ul class="list-group">
                    <% for (String info : contactList) { %>
                        <li class="list-group-item"><%= info %></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
