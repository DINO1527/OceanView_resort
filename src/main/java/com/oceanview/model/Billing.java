package com.oceanview.model;

/**
 * Model class for Billing entity to resolve the import error in BillingDAO.
 */
public class Billing {
    private int billId;
    private String resNo;
    private String guestName;
    private int daysStayed;
    private double totalAmount;
    private String billDate;

    // Default Constructor
    public Billing() {}

    // Getters and Setters
    public int getBillId() { return billId; }
    public void setBillId(int billId) { this.billId = billId; }

    public String getResNo() { return resNo; }
    public void setResNo(String resNo) { this.resNo = resNo; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public int getDaysStayed() { return daysStayed; }
    public void setDaysStayed(int daysStayed) { this.daysStayed = daysStayed; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getBillDate() { return billDate; }
    public void setBillDate(String billDate) { this.billDate = billDate; }
}