package com.oceanview.service;

import com.oceanview.dao.ReservationDAO;
import com.oceanview.model.Reservation;

public class ReservationService {
    private ReservationDAO reservationDAO = new ReservationDAO();

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
}