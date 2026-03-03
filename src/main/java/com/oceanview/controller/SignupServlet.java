package com.oceanview.controller;

import com.oceanview.service.StaffService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Controller for handling Staff Registration.
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    private StaffService staffService = new StaffService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String department = request.getParameter("department");

        // Pass to Service layer
        String result = staffService.registerStaff(fullName, email, password, confirmPassword, department);

        if ("SUCCESS".equals(result)) {
            // Setup Success Message and Redirect
            request.setAttribute("successMessage", "Account created successfully! You can now log in.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            // Setup Error Message and return to form with entered data
            request.setAttribute("errorMessage", result);
            request.setAttribute("fullName", fullName);
            request.setAttribute("email", email);
            request.setAttribute("department", department);
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }
}