package com.oceanview.service;

import org.junit.Test;
import static org.junit.Assert.*;

public class BillingServiceTest {

    @Test
    public void testCalculateTotalCost_Luxury() {
        BillingService billingService = new BillingService();

        // Input: 2 nights (March 5 to March 7), Luxury room
        String checkIn = "2026-03-05";
        String checkOut = "2026-03-07";
        String roomType = "Luxury";

        // Calculation: 2 nights * 15000.0 = 30000.0
        double expectedTotal = 30000.0;
        double actualTotal = billingService.calculateTotalCost(checkIn, checkOut, roomType);

        assertEquals("Luxury room cost calculation should be accurate", expectedTotal, actualTotal, 0.001);
    }

    @Test
    public void testGetNumberOfNights() {
        BillingService billingService = new BillingService();

        // Input: 3 days difference
        long expectedNights = 3;
        long actualNights = billingService.getNumberOfNights("2026-03-10", "2026-03-13");

        assertEquals("Number of nights calculation should be correct", expectedNights, actualNights);
    }
}