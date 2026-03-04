package com.oceanview.dao;

import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // Ungal pazhaya code (No changes here)
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

    // Pudhusaaga saerkkapadum method (For View Details)
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Reservation res = new Reservation();
                res.setResNo(rs.getString("res_no"));
                res.setGuestName(rs.getString("guest_name"));
                res.setContactNo(rs.getString("contact_no"));
                res.setAddress(rs.getString("address"));
                res.setRoomType(rs.getString("room_type"));
                res.setCheckIn(rs.getString("check_in"));
                res.setCheckOut(rs.getString("check_out"));
                list.add(res);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}