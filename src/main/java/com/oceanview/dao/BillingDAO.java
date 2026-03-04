package com.oceanview.dao;

import com.oceanview.model.Billing;
import com.oceanview.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class BillingDAO {

    public boolean saveInvoice(String resNo, String guestName, long nights, double total) {
        String sql = "INSERT INTO billing (res_no, guest_name, days_stayed, total_amount) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, resNo);
            stmt.setString(2, guestName);
            stmt.setLong(3, nights);
            stmt.setDouble(4, total);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}