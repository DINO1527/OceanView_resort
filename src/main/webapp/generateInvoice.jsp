<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ page import="com.oceanview.dao.BillingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String resId = request.getParameter("id");
    ReservationDAO dao = new ReservationDAO();
    Reservation res = dao.getReservationByNo(resId);

    // FIXED: JavaScript Redirect if Reservation not found
    if (res == null) {
%>
<script type="text/javascript">
    alert('Error: Reservation #<%= resId %> Not Found!');
    window.location.href = 'billing.jsp';
</script>
<%
        return;
    }

    // 1. Stay Duration Calculation
    java.time.LocalDate checkIn = java.time.LocalDate.parse(res.getCheckIn());
    java.time.LocalDate checkOut = java.time.LocalDate.parse(res.getCheckOut());
    long nightsLong = java.time.temporal.ChronoUnit.DAYS.between(checkIn, checkOut);
    if(nightsLong <= 0) nightsLong = 1;
    int nights = (int) nightsLong;

    // 2. Pricing Logic
    double pricePerNight = 0;
    String roomType = res.getRoomType().toLowerCase();

    if(roomType.contains("single")) pricePerNight = 5500.00;
    else if(roomType.contains("double")) pricePerNight = 9000.00;
    else if(roomType.contains("luxury") || roomType.contains("suite")) pricePerNight = 18000.00;
    else pricePerNight = 7500.00;

    double totalStayCost = (double) nights * pricePerNight;

    // 3. Save to DB
    BillingDAO billDao = new BillingDAO();
    billDao.saveInvoice(resId, res.getGuestName(), nights, totalStayCost);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Premium Invoice | Ocean View Resort</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap');
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: #0f172a; }
        .invoice-card { background: #ffffff; border-radius: 40px; }
        .accent-gradient { background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); }
        @media print { .no-print { display: none !important; } .invoice-card { border-radius: 0; box-shadow: none; } }
    </style>
</head>
<body class="p-4 md:p-12">

<div class="max-w-4xl mx-auto invoice-card shadow-2xl overflow-hidden">
    <div class="accent-gradient p-10 md:p-16 text-white flex flex-col md:flex-row justify-between items-start md:items-center">
        <div>
            <div class="flex items-center gap-4 mb-4">
                <div class="w-12 h-12 bg-blue-500 rounded-2xl flex items-center justify-center shadow-lg shadow-blue-500/20">
                    <i class="fas fa-crown text-white text-xl"></i>
                </div>
                <h1 class="text-4xl font-extrabold tracking-tighter uppercase">Ocean View</h1>
            </div>
            <p class="text-slate-400 text-[10px] font-bold tracking-[0.4em] uppercase">Luxury Hospitality • Galle, Sri Lanka</p>
        </div>
        <div class="mt-8 md:mt-0 text-right">
            <span class="px-4 py-2 bg-white/10 rounded-full text-[10px] font-black uppercase tracking-widest text-blue-400 border border-white/10">Official Invoice</span>
            <p class="text-3xl font-bold mt-4 tracking-tighter">#<%= resId %></p>
        </div>
    </div>

    <div class="p-8 md:p-16">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-16 mb-16 border-b border-slate-100 pb-16">
            <div class="space-y-4">
                <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Guest Particulars</h3>
                <div>
                    <p class="text-2xl font-extrabold text-slate-900 uppercase tracking-tight"><%= res.getGuestName() %></p>
                    <p class="text-blue-600 font-bold text-sm mt-1 uppercase italic tracking-tighter"><i class="fas fa-bed mr-2"></i> <%= res.getRoomType() %> Room</p>
                </div>
                <p class="text-slate-500 text-sm flex items-start gap-2 pt-2"><i class="fas fa-map-pin text-slate-300 mt-1"></i> <%= res.getAddress() %></p>
            </div>
            <div class="md:text-right space-y-4">
                <h3 class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Itinerary Details</h3>
                <div class="inline-flex items-center gap-4 bg-slate-50 p-4 rounded-3xl border border-slate-100">
                    <div class="text-center px-4">
                        <p class="text-[8px] font-black text-slate-400 uppercase mb-1">Check In</p>
                        <p class="text-sm font-bold text-slate-800"><%= res.getCheckIn() %></p>
                    </div>
                    <div class="w-[1px] h-8 bg-slate-200"></div>
                    <div class="text-center px-4">
                        <p class="text-[8px] font-black text-slate-400 uppercase mb-1">Check Out</p>
                        <p class="text-sm font-bold text-slate-800"><%= res.getCheckOut() %></p>
                    </div>
                </div>
                <p class="text-sm font-black text-slate-900 tracking-tighter uppercase"><%= nights %> Total Nights Stayed</p>
            </div>
        </div>

        <table class="w-full mb-12">
            <thead>
            <tr class="text-left border-b-2 border-slate-900">
                <th class="pb-6 text-[10px] font-black text-slate-900 uppercase tracking-widest">Description</th>
                <th class="pb-6 text-[10px] font-black text-slate-900 uppercase tracking-widest text-center">Nights</th>
                <th class="pb-6 text-[10px] font-black text-slate-900 uppercase tracking-widest text-right">Daily Rate</th>
                <th class="pb-6 text-[10px] font-black text-slate-900 uppercase tracking-widest text-right">Total (LKR)</th>
            </tr>
            </thead>
            <tbody class="divide-y divide-slate-50">
            <tr>
                <td class="py-10">
                    <p class="font-extrabold text-slate-900 text-lg uppercase tracking-tighter">Resort Accommodation</p>
                    <p class="text-xs text-slate-400 mt-1">Includes complimentary breakfast & Wi-Fi</p>
                </td>
                <td class="py-10 text-center font-bold text-slate-600"><%= nights %></td>
                <td class="py-10 text-right font-bold text-slate-600">LKR <%= String.format("%,.2f", pricePerNight) %></td>
                <td class="py-10 text-right font-black text-slate-900 text-xl tracking-tighter">LKR <%= String.format("%,.2f", totalStayCost) %></td>
            </tr>
            </tbody>
        </table>

        <div class="flex flex-col items-end pt-12 border-t-2 border-slate-900">
            <div class="w-full md:w-80 space-y-4">
                <div class="flex justify-between items-center text-slate-500 font-bold uppercase text-[10px] tracking-widest">
                    <span>Net Amount</span>
                    <span>LKR <%= String.format("%,.2f", totalStayCost) %></span>
                </div>
                <div class="flex justify-between items-center p-8 bg-slate-900 rounded-[2.5rem] text-white shadow-2xl">
                    <span class="text-[10px] font-black uppercase tracking-widest text-blue-400">Total Due</span>
                    <span class="text-3xl font-black tracking-tighter">LKR <%= String.format("%,.2f", totalStayCost) %></span>
                </div>
            </div>
        </div>

        <div class="mt-20 flex flex-col md:flex-row gap-6 no-print">
            <button onclick="window.print()" class="flex-[2] bg-blue-600 text-white py-6 rounded-[2rem] font-black uppercase tracking-[0.2em] text-[10px] hover:bg-blue-700 hover:shadow-2xl hover:shadow-blue-500/30 transition-all flex items-center justify-center gap-3">
                <i class="fas fa-file-invoice"></i> Print & Download PDF
            </button>
            <a href="billing.jsp" class="flex-1 bg-slate-100 text-slate-900 py-6 rounded-[2rem] font-black uppercase tracking-[0.2em] text-[10px] text-center hover:bg-slate-200 transition-all flex items-center justify-center gap-3">
                <i class="fas fa-redo"></i> New Transaction
            </a>
        </div>
    </div>
</div>

</body>
</html>