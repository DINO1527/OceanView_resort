package com.oceanview.dao;

// INTHA 4 LINES THAAN RED ERRORS-AI POKKUM
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BillingDAO {

    public void saveInvoice(String resId, String guestName, int nights, double totalAmount) {
        // Database credentials - Screenshots-il ulla error-ai poga vaikka sariyaana password kudunga
        String url = "jdbc:mysql://localhost:3306/ocean_view_db"; // Screenshot-padi ungal DB name 'ocean_view_db'
        String user = "root";
        String password = "your_db_password";

        String sql = "INSERT INTO invoices (reservation_id, guest_name, bill_date, total_amount, status) VALUES (?, ?, CURDATE(), ?, 'Paid')";

        try {
            // Driver-ai load panni connection-ai handle pannuvom
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, resId);
                ps.setString(2, guestName);
                ps.setDouble(3, totalAmount);

                ps.executeUpdate(); // Ippo thaan record phpMyAdmin-la vizhum!
                System.out.println("History Updated Successfully for: " + resId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}