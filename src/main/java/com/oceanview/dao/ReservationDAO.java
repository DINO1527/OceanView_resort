package com.oceanview.dao;

import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ReservationDAO {
    public boolean addReservation(Reservation res) {
        String sql = "INSERT INTO reservations (res_no, guest_name, contact_no, address, room_type, check_in, check_out) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, res.getResNo());
            stmt.setString(2, res.getGuestName());
            stmt.setString(3, res.getContactNo());
            stmt.setString(4, res.getAddress());
            stmt.setString(5, res.getRoomType());
            stmt.setString(6, res.getCheckIn());
            stmt.setString(7, res.getCheckOut());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}