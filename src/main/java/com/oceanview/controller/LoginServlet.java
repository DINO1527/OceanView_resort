package com.oceanview.controller;

import com.oceanview.model.Staff;
import com.oceanview.service.StaffService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Controller for handling Staff Login.
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private StaffService staffService = new StaffService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Staff loggedInStaff = staffService.loginStaff(email, password);

            // Success: Create session
            HttpSession session = request.getSession();

            // --- FIXED: Ungal Staff model-il getFullName() iruppathaal athaiye payanpaduththi ullen ---
            // Intha "user" attribute thaan dashboard-il peyarai kaatta udhavum.
            session.setAttribute("user", loggedInStaff.getFullName());

            session.setAttribute("staffUser", loggedInStaff);

            // Redirect to a secure dashboard
            response.sendRedirect(request.getContextPath() + "/dashboard.jsp");

        } catch (IllegalArgumentException e) {
            // Validation Error
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (Exception e) {
            // Authentication Error
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("email", email);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}