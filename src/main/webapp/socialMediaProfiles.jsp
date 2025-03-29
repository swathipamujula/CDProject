<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Social Media Accounts & Profiles</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #ba55d3;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .card-body {
            padding: 30px;
        }
        .btn-custom {
            background-color: #ba55d3; /* Change button background color */
            border: none;
            color: white;
        }
        .btn-custom:hover {
            background-color: #a03f8c; /* Darker shade for hover effect */
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Social Media Accounts & Profiles</h2>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">
                    Add or Update Your Social Media Links
                </div>
                <div class="card-body">
                    <%
                        String message = (String) request.getAttribute("message");
                        if (message != null) {
                    %>
                        <div class="alert alert-<%= message.contains("Saved") || message.contains("Updated") ? "success" : "warning" %>" role="alert">
                            <%= message %>
                        </div>
                    <%
                        }
                    %>
                    <form action="saveProfileLinks.jsp" method="post">
                        <input type="hidden" name="profileId" value="<%= request.getAttribute("profileId") != null ? request.getAttribute("profileId") : "" %>">
                        <div class="form-group">
                            <label for="profileName">Profile Name</label>
                            <input type="text" class="form-control" id="profileName" name="profileName" value="<%= request.getAttribute("profileName") != null ? request.getAttribute("profileName") : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="profileLink">Profile Link</label>
                            <input type="url" class="form-control" id="profileLink" name="profileLink" value="<%= request.getAttribute("profileLink") != null ? request.getAttribute("profileLink") : "" %>" required>
                        </div>
                        <button type="submit" class="btn btn-custom btn-block mt-4">Save Profile Link</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
