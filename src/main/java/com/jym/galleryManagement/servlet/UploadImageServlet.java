package com.jym.galleryManagement.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class UploadImageServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "D:\\java\\untitled\\data\\images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if admin is logged in
        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        if (fileName != null && !fileName.isEmpty()) {
            // Sanitize filename (optional but recommended)
            String safeFileName = fileName.replaceAll("[^a-zA-Z0-9._-]", "_");

            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create directory if not exist
            }

            String filePath = UPLOAD_DIR + File.separator + safeFileName;
            filePart.write(filePath);

            response.sendRedirect("jsp/admin/AdminUploadImage.jsp?success=true");
        } else {
            response.sendRedirect("jsp/admin/AdminUploadImage.jsp?error=true");
        }
    }
}
