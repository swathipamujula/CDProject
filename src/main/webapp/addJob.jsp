<!DOCTYPE html>
<html>
<head>
    <title>Add Job</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #002147;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group label {
            font-weight: bold;
        }
        button {
            transition: transform 0.2s, background-color 0.2s;
        }
        button:hover {
            transform: scale(1.05);
            background-color: #4c2882; /* New color on hover */
            color: white; /* Ensure text is visible on hover */
        }
        .btn-primary {
            background-color: #002147; /* Original color */
            border: none;
            color: white; /* Ensure text is visible */
        }
        .btn-primary:hover {
            background-color: #4c2882; /* Change color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Add Job</h1>
        <form action="addJobServlet" method="post">
            <div class="form-group">
                <label for="jobTitle">Job Title:</label>
                <input type="text" class="form-control" id="jobTitle" name="jobTitle" required>
            </div>
            <div class="form-group">
                <label for="jobDescription">Job Description:</label>
                <textarea class="form-control" id="jobDescription" name="jobDescription" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="companyId">Company ID:</label>
                <input type="text" class="form-control" id="companyId" name="companyId" required>
            </div>
            <div class="form-group">
                <label for="companyName">Company Name:</label>
                <input type="text" class="form-control" id="companyName" name="companyName" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Add Job</button>
        </form>
    </div>
</body>
</html>
