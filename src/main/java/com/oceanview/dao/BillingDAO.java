package com.oceanview.dao;
import java.sql.*;

public class BillingDAO {
    // Database connection details (ungal settings-kku mathikonga)
    private String url = "jdbc:mysql://localhost:3306/oceanview";
    private String user = "root";
    private String password = "your_password";

    public void saveInvoice(String resId, String guestName, int nights, double totalAmount) {
        // Mukkiam: Invoices table-il data-vai INSERT panna intha SQL venum
        String sql = "INSERT INTO invoices (reservation_id, guest_name, bill_date, total_amount, status) VALUES (?, ?, CURDATE(), ?, 'Paid')";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, resId);
            ps.setString(2, guestName);
            ps.setDouble(3, totalAmount);

            ps.executeUpdate(); // Ippo thaan database-la record save aagum!
            System.out.println("Invoice saved to History successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}