package com.oceanview.service;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

public class ReservationService {
    private ReservationDAO reservationDAO = new ReservationDAO();

    /**
     * Handles the logic for creating a new reservation.
     */
    public String createReservation(String resNo, String guestName, String contactNo, String address, String roomType, String checkIn, String checkOut) {
        Reservation res = new Reservation();
        res.setResNo(resNo);
        res.setGuestName(guestName);
        res.setContactNo(contactNo);
        res.setAddress(address);
        res.setRoomType(roomType);
        res.setCheckIn(checkIn);
        res.setCheckOut(checkOut);

        // Call DAO to add record to database
        if(reservationDAO.addReservation(res)) {
            return "SUCCESS";
        } else {
            return "Database Error!";
        }
    }

    /**
     * Handles the logic for updating existing reservation details.
     */
    public boolean updateReservationDetails(String resNo, String guestName, String contactNo, String roomType, String checkIn, String checkOut) {
        // Use full class reference to prevent ambiguity errors
        com.oceanview.model.Reservation res = new com.oceanview.model.Reservation();

        // Map parameters to the Reservation object
        res.setResNo(resNo);
        res.setGuestName(guestName);
        res.setContactNo(contactNo);
        res.setRoomType(roomType);
        res.setCheckIn(checkIn);
        res.setCheckOut(checkOut);

        // FIX: Use updateReservation method instead of getAllReservations
        return reservationDAO.updateReservation(res);
    }
} // End of class