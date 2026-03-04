<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ page import="com.oceanview.dao.BillingDAO" %> <%-- FIXED: Missing Import added --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resId = request.getParameter("id");
    ReservationDAO dao = new ReservationDAO();
    Reservation res = dao.getReservationByNo(resId);

    if (res == null) {
        out.println("<script>alert('Reservation ID Not Found!'); window.location='billing.jsp';</script>");
        return;
    }

    // 1. Calculate Nights (long to int conversion)
    java.time.LocalDate checkIn = java.time.LocalDate.parse(res.getCheckIn());
    java.time.LocalDate checkOut = java.time.LocalDate.parse(res.getCheckOut());
    long nightsLong = java.time.temporal.ChronoUnit.DAYS.between(checkIn, checkOut);

    if(nightsLong <= 0) nightsLong = 1;
    int nights = (int) nightsLong; // FIXED: Typecasting long to int for DAO

    // 2. Room Rates Logic
    double pricePerNight = 0;
    String roomType = res.getRoomType().toLowerCase();

    if(roomType.contains("single")) {
        pricePerNight = 5500.00;
    } else if(roomType.contains("double")) {
        pricePerNight = 9000.00;
    } else if(roomType.contains("luxury") || roomType.contains("suite")) {
        pricePerNight = 18000.00;
    } else {
        pricePerNight = 7500.00;
    }

    double totalStayCost = nights * pricePerNight;

    // 3. Save to Database
    BillingDAO billDao = new BillingDAO();
    // FIXED: Ensure variable name matches nights and method signature
    boolean isSaved = billDao.saveInvoice(resId, res.getName(), nights, totalStayCost);
%>