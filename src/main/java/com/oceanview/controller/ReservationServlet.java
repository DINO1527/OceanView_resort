package com.oceanview.controller;

import com.oceanview.service.ReservationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addReservation")
public class ReservationServlet extends HttpServlet {
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Form parameters
        String resNo = request.getParameter("resNo");
        String guestName = request.getParameter("guestName");
        String contactNo = request.getParameter("contactNo");
        String address = request.getParameter("address");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        try {
            // Service layer-ai call seigiradhu
            String result = reservationService.createReservation(resNo, guestName, contactNo, address, roomType, checkIn, checkOut);

            if ("SUCCESS".equals(result)) {
                // Success aanaal status-udan redirect seiyum
                response.sendRedirect(request.getContextPath() + "/Reservation.jsp?status=success");
            } else {
                // Error vandhaal message-ai anuppum
                request.setAttribute("errorMessage", result);
                request.getRequestDispatcher("/Reservation.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Error vandhaal login-ukku pookamal irukka forward seiyungal
            request.setAttribute("errorMessage", "Database Error: " + e.getMessage());
            request.getRequestDispatcher("/Reservation.jsp").forward(request, response);
        }
    }
}