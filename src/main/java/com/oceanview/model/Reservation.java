package com.oceanview.model;

public class Reservation {
    private String resNo;
    private String guestName;
    private String contactNo;
    private String address;
    private String roomType;
    private String checkIn;
    private String checkOut;

    // Getters and Setters
    public String getResNo() { return resNo; }
    public void setResNo(String resNo) { this.resNo = resNo; }
    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }
    public String getContactNo() { return contactNo; }
    public void setContactNo(String contactNo) { this.contactNo = contactNo; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }
    public String getCheckIn() { return checkIn; }
    public void setCheckIn(String checkIn) { this.checkIn = checkIn; }
    public String getCheckOut() { return checkOut; }
    public void setCheckOut(String checkOut) { this.checkOut = checkOut; }
}