package com.oceanview.controller;

import com.oceanview.service.ReservationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateReservation")
public class UpdateReservationServlet extends HttpServlet {


    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Form parameters
        String resNo = request.getParameter("resNo");
        String guestName = request.getParameter("guestName");
        String contactNo = request.getParameter("contactNo");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        try {
            // Service layer call
            boolean isUpdated = reservationService.updateReservationDetails(resNo, guestName, contactNo, roomType, checkIn, checkOut);

            if (isUpdated) {
                // Success redirect
                response.sendRedirect(request.getContextPath() + "/ViewReservations.jsp?update=success");
            } else {
                // Error redirect
                response.sendRedirect(request.getContextPath() + "/editReservation.jsp?id=" + resNo + "&status=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/editReservation.jsp?id=" + resNo + "&status=exception");
        }
    }
}