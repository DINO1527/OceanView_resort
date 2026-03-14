package com.oceanview.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/billingHistory")
public class BillingHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session Check: Login pannala na login page-kku anuppum [cite: 2026-03-05]
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, Object>> billingList = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oceanview_db", "root", ""); // Unga password-ai poodunga [cite: 2026-02-25]

            String sql = "SELECT * FROM billing ORDER BY payment_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> bill = new HashMap<>();
                bill.put("id", rs.getInt("bill_id"));
                bill.put("name", rs.getString("guest_name"));
                bill.put("amount", rs.getDouble("total_amount"));
                bill.put("date", rs.getTimestamp("payment_date"));
                bill.put("status", rs.getString("status"));
                billingList.add(bill);
            }
            request.setAttribute("billingList", billingList);
            request.getRequestDispatcher("/billingHistory.jsp").forward(request, response);
        } catch (Exception e) { e.printStackTrace(); }
    }
}