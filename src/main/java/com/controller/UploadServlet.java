package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Directory where uploaded files will be saved, relative to the web app's root directory.
        String uploadDirectory = "uploads";
        
        // Ensure the upload directory exists.
        File uploadDir = new File(getServletContext().getRealPath("") + File.separator + uploadDirectory);
        if (!uploadDir.exists()) uploadDir.mkdir();
        
        // Get the file part from the request.
        Part filePart = request.getPart("file");
        
        // Get the file name.
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Save the file.
        try (InputStream fileContent = filePart.getInputStream()) {
            File file = new File(uploadDir, fileName);
            Files.copy(fileContent, file.toPath());
        }
        
        // Set response content type.
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("<html><body><script>");
        response.getWriter().print("alert('File uploaded successfully to " + uploadDirectory + "/" + fileName + "');");
        response.getWriter().print("window.location.href = 'UserDashboard.jsp';");
        response.getWriter().print("</script></body></html>");
    }
}
