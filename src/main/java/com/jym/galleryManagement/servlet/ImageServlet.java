package com.jym.galleryManagement.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.logging.Logger;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {
    private static final String IMAGE_DIR = "D:\\java\\untitled\\data\\images";
    private static final Logger LOGGER = Logger.getLogger(ImageServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fileName = request.getParameter("name");
        if (fileName == null || fileName.isEmpty() || fileName.contains("..") || !isValidFileName(fileName)) {
            LOGGER.warning("Invalid file name: " + fileName);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid or unsafe file name");
            return;
        }

        File file = new File(IMAGE_DIR, fileName);
        if (!file.exists() || !file.isFile()) {
            LOGGER.warning("File not found: " + file.getAbsolutePath());
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            return;
        }

        String contentType = getServletContext().getMimeType(file.getName());
        if (contentType == null || !contentType.startsWith("image/")) {
            contentType = "application/octet-stream";
        }
        response.setContentType(contentType);
        response.setContentLengthLong(file.length());

        try (BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
             OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int length;
            while ((length = in.read(buffer)) > 0) {
                out.write(buffer, 0, length);
            }
        } catch (IOException e) {
            LOGGER.severe("Error serving image: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error serving image");
        }
    }

    private boolean isValidFileName(String fileName) {
        return fileName.toLowerCase().matches("^[a-zA-Z0-9-_]+\\.(jpg|png|jpeg)$");
    }
}