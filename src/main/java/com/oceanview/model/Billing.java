package com.oceanview.model;

public class Billing {
    private String invoiceId;
    private String resId;
    private String guestName;
    private String billDate;
    private double totalAmount;

    // Standard Getters (Fixes JSP Red Errors)
    public String getInvoiceId() { return invoiceId; }
    public String getResId() { return resId; }
    public String getGuestName() { return guestName; }
    public String getBillDate() { return billDate; }
    public double getTotalAmount() { return totalAmount; }

    // Standard Setters (Fixes DAO Mapping Errors)
    public void setInvoiceId(String invoiceId) { this.invoiceId = invoiceId; }
    public void setResId(String resId) { this.resId = resId; }
    public void setGuestName(String guestName) { this.guestName = guestName; }
    public void setBillDate(String billDate) { this.billDate = billDate; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}