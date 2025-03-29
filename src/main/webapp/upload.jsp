<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Document</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .upload-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }
        .upload-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .file-input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
        }
        .upload-btn {
            background-color: #ba55d3;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .upload-btn:hover {
            background-color: #9b3eb1;
        }
    </style>
</head>
<body>
    <div class="upload-container">
        <h2>Upload Your Document</h2>
        <form action="uploadServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="file" class="file-input" />
            <br/><br/>
            <input type="submit" value="UploadServlet" class="upload-btn" />
        </form>
    </div>
</body>
</html>
