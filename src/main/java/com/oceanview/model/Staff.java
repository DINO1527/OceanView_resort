package com.oceanview.model;

/**
 * Model representing a Staff member at Ocean View Resort.
 */
public class Staff {
    private int id;
    private String fullName;
    private String email;
    private String passwordHash;
    private String department;

    // Constructors
    public Staff() {}

    public Staff(String fullName, String email, String passwordHash, String department) {
        this.fullName = fullName;
        this.email = email;
        this.passwordHash = passwordHash;
        this.department = department;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
}