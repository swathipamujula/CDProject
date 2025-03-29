<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply for Jobs</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #d891ef;
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
            background-color: #ba55d3; /* Custom color */
            color: white;
        }
        .apply-btn {
            background-color: #ba55d3; /* Custom color */
            border: none;
            color: white;
        }
        .apply-btn:hover {
            background-color: #a04ea0; /* Slightly darker shade on hover */
        }
        .logout-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Available Jobs</h1>

        <% if (request.getAttribute("applicationStatus") != null) { %>
            <div class="alert alert-<%= request.getAttribute("applicationStatus").equals("success") ? "success" : "danger" %> alert-dismissible fade show" role="alert">
                <strong><%= request.getAttribute("applicationStatus").equals("success") ? "Success!" : "Oops!" %></strong> <%= request.getAttribute("applicationStatus").equals("success") ? "Your application has been submitted successfully." : "There was an issue with your application." %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <% } %>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Job Title</th>
                    <th>Description</th>
                    <th>Company Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "admin");
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT id, title, description, company_name FROM jobs")) {

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getString("company_name") %></td>
                    <td>
                        <button class="btn apply-btn" data-toggle="modal" data-target="#applyModal" data-job-id="<%= rs.getInt("id") %>">Apply</button>
                    </td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
        
        <!-- Logout Button -->
        <form action="LogoutServlet1" method="post" class="logout-btn">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="applyModalLabel">Apply for Job</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="applyJobServlet" method="post">
                    <div class="modal-body">
                        <input type="hidden" id="modalJobId" name="jobId" />
                        <div class="form-group">
                            <label for="userName">Name:</label>
                            <input type="text" class="form-control" id="userName" name="userName" required>
                        </div>
                        <div class="form-group">
                            <label for="skills">Skills:</label>
                            <input type="text" class="form-control" id="skills" name="skills" required>
                        </div>
                        <div class="form-group">
                            <label for="cgpa">CGPA:</label>
                            <input type="text" class="form-control" id="cgpa" name="cgpa" required>
                        </div>
                        <div class="form-group">
                            <label for="backlogs">Backlogs:</label>
                            <input type="text" class="form-control" id="backlogs" name="backlogs" required>
                        </div>
                        <div class="form-group">
                            <label for="certifications">Certifications:</label>
                            <input type="text" class="form-control" id="certifications" name="certifications">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit Application</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $('#applyModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var jobId = button.data('job-id'); // Extract info from data-* attributes
            var modal = $(this);
            modal.find('#modalJobId').val(jobId); // Set the jobId in the hidden input field
        });
    </script>
</body>
</html>
