package com.oceanview.dao;

import com.oceanview.model.Reservation;
import com.oceanview.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // 1. New Reservation saerka (Existing)
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

    // 2. Ella details-aiyum table-il kaatta (Existing)
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY res_no DESC";

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

    // 3. EDIT prachinaiyai sari seiya: Specific ID moolam data edukka (Existing)
    public Reservation getReservationByNo(String resNo) {
        Reservation res = null;
        String sql = "SELECT * FROM reservations WHERE res_no = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, resNo);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    res = new Reservation();
                    res.setResNo(rs.getString("res_no"));
                    res.setGuestName(rs.getString("guest_name"));
                    res.setContactNo(rs.getString("contact_no"));
                    res.setAddress(rs.getString("address"));
                    res.setRoomType(rs.getString("room_type"));
                    res.setCheckIn(rs.getString("check_in"));
                    res.setCheckOut(rs.getString("check_out"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    // 4. Update Reservation details in database (NEW - Fixes the Service Error)
    public boolean updateReservation(Reservation res) {
        // SQL query to update details based on reservation number
        String sql = "UPDATE reservations SET guest_name=?, contact_no=?, room_type=?, check_in=?, check_out=? WHERE res_no=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, res.getGuestName());
            stmt.setString(2, res.getContactNo());
            stmt.setString(3, res.getRoomType());
            stmt.setString(4, res.getCheckIn());
            stmt.setString(5, res.getCheckOut());
            stmt.setString(6, res.getResNo());

            // Returns true if one or more rows were updated
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}