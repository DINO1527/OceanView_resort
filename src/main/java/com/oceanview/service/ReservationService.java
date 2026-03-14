package com.oceanview.service;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

public class ReservationService {
    private final ReservationDAO reservationDAO = new ReservationDAO();

    // Existing method
    public String createReservation(String resNo, String guestName, String contactNo, String address, String roomType, String checkIn, String checkOut) {
        Reservation res = new Reservation();
        res.setResNo(resNo);
        res.setGuestName(guestName);
        res.setContactNo(contactNo);
        res.setAddress(address);
        res.setRoomType(roomType);
        res.setCheckIn(checkIn);
        res.setCheckOut(checkOut);

        if(reservationDAO.addReservation(res)) {
            return "SUCCESS";
        } else {
            return "Database Error!";
        }
    }


    public boolean updateReservationDetails(String resNo, String guestName, String contactNo, String roomType, String checkIn, String checkOut) {
        // Class name-ai full
        com.oceanview.model.Reservation res = new com.oceanview.model.Reservation();
        res.setResNo(resNo);
        res.setGuestName(guestName);
        res.setContactNo(contactNo);
        res.setRoomType(roomType);
        res.setCheckIn(checkIn);
        res.setCheckOut(checkOut);

        // DAO-
        return reservationDAO.updateReservation(res);
    }

    public boolean createReservation(String ignoredG001, String ignoredR105, String ignoredDate1) {
        return false;
    }
}