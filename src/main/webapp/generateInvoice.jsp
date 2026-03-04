<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resId = request.getParameter("id");
    ReservationDAO dao = new ReservationDAO();
    Reservation res = dao.getReservationByNo(resId);

    // Error Handling
    if (res == null) {
        out.println("<script>alert('Reservation ID Not Found!'); window.location='billing.jsp';</script>");
        return;
    }

    // 1. Calculate Nights Stayed (ChronoUnit uses java.time)
    java.time.LocalDate checkIn = java.time.LocalDate.parse(res.getCheckIn());
    java.time.LocalDate checkOut = java.time.LocalDate.parse(res.getCheckOut());
    long nights = java.time.temporal.ChronoUnit.DAYS.between(checkIn, checkOut);

    if(nights <= 0) nights = 1; // Minimum 1 night charge

    // 2. Room Rates Logic (Based on your requirements)
    double pricePerNight = 0;
    String roomType = res.getRoomType().toLowerCase();

    if(roomType.contains("single")) {
        pricePerNight = 5500.00;
    } else if(roomType.contains("double")) {
        pricePerNight = 9000.00;
    } else if(roomType.contains("luxury") || roomType.contains("suite")) {
        pricePerNight = 18000.00;
    } else {
        pricePerNight = 7500.00; // Default Standard Rate
    }

    double totalStayCost = nights * pricePerNight;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Invoice | <%= resId %></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-slate-50 p-6 md:p-12">

<div class="max-w-3xl mx-auto bg-white rounded-[45px] shadow-2xl border border-slate-100 overflow-hidden">
    <div class="bg-slate-900 p-10 text-white flex justify-between items-center">
        <div>
            <h1 class="text-3xl font-black tracking-tighter uppercase">Ocean View Resort</h1>
            <p class="text-blue-400 text-[10px] font-black tracking-[4px] uppercase mt-2">Operational Excellence | Galle</p>
        </div>
        <div class="text-right">
            <p class="text-slate-400 text-[10px] font-black uppercase tracking-widest">Res ID</p>
            <p class="text-xl font-bold">#<%= resId %></p>
        </div>
    </div>

    <div class="p-12">
        <div class="grid grid-cols-2 gap-10 mb-12 border-b border-slate-50 pb-10">
            <div>
                <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-3">Bill To</h3>
                <p class="text-xl font-bold text-slate-800"><%= res.getName() %></p>
                <p class="text-slate-500 text-sm mt-1 italic"><%= res.getRoomType() %> Room Selection</p>
            </div>
            <div class="text-right">
                <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-widest mb-3">Duration</h3>
                <p class="text-sm font-bold text-slate-800"><%= res.getCheckIn() %> <i class="fas fa-arrow-right mx-2 text-blue-400 text-[10px]"></i> <%= res.getCheckOut() %></p>
                <p class="text-blue-600 font-black text-xs mt-2 uppercase tracking-tighter"><%= nights %> Nights Total Stay</p>
            </div>
        </div>

        <table class="w-full mb-10">
            <thead>
            <tr class="text-left border-b-2 border-slate-100">
                <th class="pb-5 text-[10px] font-black text-slate-400 uppercase tracking-widest">Stay Description</th>
                <th class="pb-5 text-[10px] font-black text-slate-400 uppercase tracking-widest text-center">Nightly Rate</th>
                <th class="pb-5 text-[10px] font-black text-slate-400 uppercase tracking-widest text-right">Total (LKR)</th>
            </tr>
            </thead>
            <tbody class="divide-y divide-slate-50">
            <tr>
                <td class="py-8">
                    <p class="font-bold text-slate-800">Accommodation & Services</p>
                    <p class="text-xs text-slate-400 mt-1">Room: <%= res.getRoomType() %></p>
                </td>
                <td class="py-8 text-center font-bold text-slate-600">LKR <%= String.format("%,.2f", pricePerNight) %></td>
                <td class="py-8 text-right font-black text-slate-900">LKR <%= String.format("%,.2f", totalStayCost) %></td>
            </tr>
            </tbody>
        </table>

        <div class="bg-slate-900 rounded-[30px] p-8 flex justify-end text-white">
            <div class="w-72 space-y-4">
                <div class="flex justify-between items-center text-[10px] font-black text-slate-400 uppercase tracking-widest">
                    <span>Net Total</span>
                    <span>LKR <%= String.format("%,.2f", totalStayCost) %></span>
                </div>
                <div class="flex justify-between items-center pt-4 border-t border-white/10">
                    <span class="text-lg font-bold tracking-tight">Grand Total</span>
                    <span class="text-2xl font-black text-blue-400">LKR <%= String.format("%,.2f", totalStayCost) %></span>
                </div>
            </div>
        </div>

        <div class="mt-12 flex gap-5 no-print">
            <button onclick="window.print()" class="flex-1 bg-blue-600 text-white py-5 rounded-2xl font-black uppercase tracking-widest hover:bg-blue-700 transition-all flex items-center justify-center gap-3">
                <i class="fas fa-print"></i> Print Invoice
            </button>
            <a href="billing.jsp" class="flex-1 bg-slate-100 text-slate-500 py-5 rounded-2xl font-black uppercase tracking-widest text-center hover:bg-slate-200 transition-all">
                Search Again
            </a>
        </div>
    </div>
</div>

<style> @media print { .no-print { display: none !important; } body { background: white; padding: 0; } .max-w-3xl { box-shadow: none; border: none; width: 100%; max-width: none; } } </style>
</body>
</html>