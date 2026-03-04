package com.oceanview.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class BillingService {

    // Method to calculate total cost based on nights and room type
    public double calculateTotalCost(String checkIn, String checkOut, String roomType) {
        try {
            // Parsing String dates to LocalDate objects
            LocalDate d1 = LocalDate.parse(checkIn);
            LocalDate d2 = LocalDate.parse(checkOut);

            // Calculating the number of nights (days difference)
            long nights = ChronoUnit.DAYS.between(d1, d2);

            // If check-in and check-out are the same day, count as 1 night minimum
            if (nights <= 0) nights = 1;

            double pricePerNight = 0;

            // Setting rates based on room type
            if ("Single".equalsIgnoreCase(roomType)) {
                pricePerNight = 5000.0;
            } else if ("Double".equalsIgnoreCase(roomType)) {
                pricePerNight = 8000.0;
            } else if ("Luxury".equalsIgnoreCase(roomType)) {
                pricePerNight = 15000.0;
            }

            return nights * pricePerNight;
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    // Method to get the number of nights separately for the invoice display
    public long getNumberOfNights(String checkIn, String checkOut) {
        LocalDate d1 = LocalDate.parse(checkIn);
        LocalDate d2 = LocalDate.parse(checkOut);
        long nights = ChronoUnit.DAYS.between(d1, d2);
        return (nights <= 0) ? 1 : nights;
    }
}