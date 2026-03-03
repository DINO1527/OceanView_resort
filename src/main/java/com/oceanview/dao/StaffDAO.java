
package com.oceanview.dao;

import com.oceanview.model.Staff;
import com.oceanview.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Handles all direct database operations for Staff.
 */
public class StaffDAO {

    public boolean registerStaff(Staff staff) throws SQLException {
        String sql = "INSERT INTO staff (full_name, email, password_hash, department) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, staff.getFullName());
            stmt.setString(2, staff.getEmail());
            stmt.setString(3, staff.getPasswordHash());
            stmt.setString(4, staff.getDepartment());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public Staff authenticateStaff(String email, String hashedPassword) throws SQLException {
        String sql = "SELECT * FROM staff WHERE email = ? AND password_hash = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, hashedPassword);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Staff staff = new Staff();
                    staff.setId(rs.getInt("id"));
                    staff.setFullName(rs.getString("full_name"));
                    staff.setEmail(rs.getString("email"));
                    staff.setDepartment(rs.getString("department"));
                    return staff;
                }
            }
        }
        return null;
    }

    public boolean isEmailRegistered(String email) throws SQLException {
        String sql = "SELECT id FROM staff WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
}