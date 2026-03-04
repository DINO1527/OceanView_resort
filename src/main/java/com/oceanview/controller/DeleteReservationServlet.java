package com.oceanview.controller;

import com.oceanview.service.ReservationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteReservation")
public class DeleteReservationServlet extends HttpServlet {

    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching the reservation ID from the URL parameter
        String resNo = request.getParameter("id");

        try {
            // Calling the service layer to delete the record
            boolean isDeleted = reservationService.deleteReservation(resNo);

            if (isDeleted) {
                // Success: Redirect back to the table with a success flag
                response.sendRedirect(request.getContextPath() + "/ViewReservations.jsp?delete=success");
            } else {
                // Failure: Redirect back with an error flag
                response.sendRedirect(request.getContextPath() + "/ViewReservations.jsp?delete=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Exception: Redirect back with an exception flag
            response.sendRedirect(request.getContextPath() + "/ViewReservations.jsp?delete=exception");
        }
    }
}