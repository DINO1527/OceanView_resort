package com.oceanview.service;

import com.oceanview.dao.StaffDAO;
import com.oceanview.model.Staff;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.regex.Pattern;

/**
 * Business logic layer. Handles validations and data processing before hitting the DAO.
 */
public class StaffService {

    private final StaffDAO staffDAO = new StaffDAO();
    private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@(.+)$";

    public String registerStaff(String fullName, String email, String password, String confirmPassword, String department) {
        // 1. Standard Validations
        if (fullName == null || fullName.trim().isEmpty()) return "Full Name is required.";
        if (email == null || !Pattern.matches(EMAIL_REGEX, email)) return "Invalid email format.";
        if (password == null || password.length() < 6) return "Password must be at least 6 characters long.";
        if (!password.equals(confirmPassword)) return "Passwords do not match.";
        if (department == null || department.isEmpty()) return "Please select a department.";

        try {
            // 2. Business Logic Validation
            if (staffDAO.isEmailRegistered(email)) {
                return "This email is already registered to a staff member.";
            }

            // 3. Process Data (Hash Password)
            String hashedPassword = hashPassword(password);
            Staff newStaff = new Staff(fullName, email, hashedPassword, department);

            // 4. Save to DB
            boolean isRegistered = staffDAO.registerStaff(newStaff);
            if (isRegistered) {
                return "SUCCESS";
            } else {
                return "Registration failed due to a system error. Please try again.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error occurred: " + e.getMessage();
        }
    }

    public Staff loginStaff(String email, String password) throws Exception {
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Email and Password are required.");
        }

        String hashedPassword = hashPassword(password);
        Staff staff = staffDAO.authenticateStaff(email, hashedPassword);

        if (staff == null) {
            throw new Exception("Invalid email or password.");
        }
        return staff;
    }

    // Standard SHA-256 password hashing for security
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Hashing algorithm not found", e);
        }
    }

    public boolean login(String mail, String wrongpass) {
        return false;
    }

    public boolean authenticate(String email, String password) {
        return false;
    }
}