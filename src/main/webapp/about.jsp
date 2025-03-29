<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #9a4eae; /* Added background color */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        .container {
            margin-top: 100px;
        }
        .company-card {
            margin-bottom: 20px;
        }
        .company-card img {
            max-width: 100px;
            border-radius: 50%;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.5);
        }
        .navbar-nav .nav-link {
            color: white;
            transition: color 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #ffd700;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1 class="text-center mt-5 mb-4 text-white">About the Companies</h1>
        <div class="row">
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/google.jpg" alt="Google Logo">
                    <div class="card-body">
                        <h5 class="card-title">Google</h5>
                        <p class="card-text">Google LLC is an American multinational technology company specializing in Internet-related services and products. It is known for its search engine, advertising technologies, cloud computing, software, and hardware.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/amazon.jpg" alt="Amazon Logo">
                    <div class="card-body">
                        <h5 class="card-title">Amazon</h5>
                        <p class="card-text">Amazon.com, Inc. is an American multinational technology company focusing on e-commerce, cloud computing, digital streaming, and artificial intelligence. It is the largest Internet retailer in the world.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/intel.jpg" alt="Intel Logo">
                    <div class="card-body">
                        <h5 class="card-title">Intel</h5>
                        <p class="card-text">Intel Corporation is an American multinational corporation and technology company. It is the developer of semiconductor chips and is well known for its microprocessors used in personal computers.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/microsoft.png" alt="Microsoft Logo">
                    <div class="card-body">
                        <h5 class="card-title">Microsoft</h5>
                        <p class="card-text">Microsoft Corporation is an American multinational technology company known for developing, licensing, and supporting a wide range of software products, including its popular Windows operating systems and Office productivity suite.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/ibm.jpg" alt="IBM Logo">
                    <div class="card-body">
                        <h5 class="card-title">IBM</h5>
                        <p class="card-text">International Business Machines Corporation (IBM) is an American multinational technology and consulting company. IBM is known for its computer hardware, software, and services, including cloud computing and AI technologies.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/cisco.jpg" alt="Cisco Logo">
                    <div class="card-body">
                        <h5 class="card-title">Cisco</h5>
                        <p class="card-text">Cisco Systems, Inc. is an American multinational technology conglomerate that designs, manufactures, and sells networking hardware, telecommunications equipment, and other high-technology products and services.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 company-card">
                <div class="card">
                    <img class="card-img-top" src="image/barclays.jpg" alt="Barclays Logo">
                    <div class="card-body">
                        <h5 class="card-title">Barclays</h5>
                        <p class="card-text">Barclays PLC is a British multinational investment bank and financial services company. It provides various services, including retail banking, investment banking, and wealth management.</p>
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
