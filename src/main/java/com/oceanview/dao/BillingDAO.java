package com.oceanview.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BillingDAO {

    public void saveInvoice(String resId, String guestName, int nights, double totalAmount) {
        // Database credentials
        String url = "jdbc:mysql://localhost:3306/ocean_view_db"; // Screenshot-DB name 'ocean_view_db'
        String user = "root";
        String password = "your_db_password";

        String sql = "INSERT INTO invoices (reservation_id, guest_name, bill_date, total_amount, status) VALUES (?, ?, CURDATE(), ?, 'Paid')";

        try {
            // Driver-load -connection- handle
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, resId);
                ps.setString(2, guestName);
                ps.setDouble(3, totalAmount);

                ps.executeUpdate(); // adding the record phpMyAdmin
                System.out.println("History Updated Successfully for: " + resId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}