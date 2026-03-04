<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oceanview.model.Reservation, com.oceanview.dao.ReservationDAO, com.oceanview.service.BillingService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Invoice | Ocean View Resort</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @media print {
            .no-print { display: none; }
            body { background: white; p: 0; }
        }
    </style>
</head>
<body class="bg-slate-900 min-h-screen p-4 md:p-10">

<%
    String resNo = request.getParameter("id");
    ReservationDAO dao = new ReservationDAO();
    Reservation res = dao.getReservationByNo(resNo); //

    if (res != null) {
        BillingService billingService = new BillingService();

        // Calculating Stay Details
        long nights = billingService.getNumberOfNights(res.getCheckIn(), res.getCheckOut());
        double totalCost = billingService.calculateTotalCost(res.getCheckIn(), res.getCheckOut(), res.getRoomType());
        double pricePerNight = totalCost / nights;
%>

<div class="max-w-4xl mx-auto bg-white rounded-3xl overflow-hidden shadow-2xl">
    <div class="bg-blue-600 p-8 text-white flex justify-between items-center">
        <div>
            <h1 class="text-4xl font-black tracking-tighter italic">OCEAN VIEW</h1>
            <p class="text-blue-100 text-sm">Galle, Sri Lanka</p>
        </div>
        <div class="text-right">
            <h2 class="text-2xl font-bold uppercase">Invoice</h2>
            <p class="opacity-80 text-sm">#INV-<%= res.getResNo() %></p>
        </div>
    </div>

    <div class="p-10">
        <div class="grid grid-cols-2 gap-10 mb-10 border-b pb-10 border-slate-100">
            <div>
                <h3 class="text-slate-400 text-xs font-bold uppercase tracking-widest mb-3">Bill To</h3>
                <p class="text-xl font-bold text-slate-800"><%= res.getGuestName() %></p>
                <p class="text-slate-500"><%= res.getContactNo() %></p>
            </div>
            <div class="text-right">
                <h3 class="text-slate-400 text-xs font-bold uppercase tracking-widest mb-3">Stay Period</h3>
                <p class="text-slate-800 font-semibold"><%= res.getCheckIn() %> to <%= res.getCheckOut() %></p>
                <p class="text-blue-600 font-bold"><%= nights %> Night(s)</p>
            </div>
        </div>

        <table class="w-full mb-10">
            <thead>
            <tr class="text-left border-b-2 border-slate-100">
                <th class="py-4 text-slate-400 text-xs font-bold uppercase tracking-widest">Description</th>
                <th class="py-4 text-slate-400 text-xs font-bold uppercase tracking-widest text-center">Nights</th>
                <th class="py-4 text-slate-400 text-xs font-bold uppercase tracking-widest text-right">Rate (LKR)</th>
                <th class="py-4 text-slate-400 text-xs font-bold uppercase tracking-widest text-right">Total</th>
            </tr>
            </thead>
            <tbody>
            <tr class="border-b border-slate-50">
                <td class="py-6 font-bold text-slate-700">Room Accommodation (<%= res.getRoomType() %>)</td>
                <td class="py-6 text-center text-slate-600"><%= nights %></td>
                <td class="py-6 text-right text-slate-600"><%= String.format("%,.2f", pricePerNight) %></td>
                <td class="py-6 text-right font-bold text-slate-800"><%= String.format("%,.2f", totalCost) %></td>
            </tr>
            </tbody>
        </table>

        <div class="flex justify-end">
            <div class="w-full max-w-xs space-y-3">
                <div class="flex justify-between text-slate-500">
                    <span>Subtotal</span>
                    <span><%= String.format("%,.2f", totalCost) %></span>
                </div>
                <div class="flex justify-between text-slate-500">
                    <span>Service Tax (0%)</span>
                    <span>0.00</span>
                </div>
                <div class="flex justify-between text-2xl font-black text-blue-600 pt-3 border-t">
                    <span>TOTAL</span>
                    <span>LKR <%= String.format("%,.2f", totalCost) %></span>
                </div>
            </div>
        </div>

        <div class="mt-20 pt-10 border-t border-slate-100 flex justify-between items-center no-print">
            <p class="text-slate-400 text-sm italic">Thank you for choosing Ocean View Resort.</p>
            <div class="flex gap-4">
                <button onclick="window.print()" class="bg-slate-800 text-white px-8 py-3 rounded-xl font-bold hover:bg-slate-700 transition-all">Print Invoice</button>
                <a href="ViewReservations.jsp" class="bg-blue-100 text-blue-600 px-8 py-3 rounded-xl font-bold hover:bg-blue-200 transition-all">Close</a>
            </div>
        </div>
    </div>
</div>

<% } else { %>
<div class="text-center text-white">
    <p class="text-2xl font-bold mb-4">Reservation Not Found.</p>
    <a href="ViewReservations.jsp" class="text-blue-400 underline">Back to Records</a>
</div>
<% } %>

</body>
</html>