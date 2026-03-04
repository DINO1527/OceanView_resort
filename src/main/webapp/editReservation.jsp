<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oceanview.model.Reservation, com.oceanview.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Reservation | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg { background: linear-gradient(rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.9)), url('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1920&q=80'); background-size: cover; background-attachment: fixed; }

        /* Dropdown options visibility fix */
        select option {
            background-color: #1e293b; /* Dark background so white text is visible */
            color: white;
        }
    </style>
</head>
<body class="hero-bg min-h-screen flex items-center justify-center p-8">
<%
    String resNo = request.getParameter("id");
    ReservationDAO dao = new ReservationDAO();
    Reservation res = dao.getReservationByNo(resNo);
    if(res != null) {
%>
<div class="bg-white/10 backdrop-blur-xl p-10 rounded-[40px] border border-white/20 w-full max-w-2xl shadow-2xl">
    <h2 class="text-3xl font-black text-white mb-8">Update Reservation</h2>
    <form action="updateReservation" method="POST" class="space-y-6">
        <input type="hidden" name="resNo" value="<%= res.getResNo() %>">

        <div class="grid grid-cols-2 gap-6">
            <div>
                <label class="text-blue-400 text-xs font-bold uppercase tracking-widest block mb-2">Guest Name</label>
                <input type="text" name="guestName" value="<%= res.getGuestName() %>" class="w-full bg-white/5 border border-white/10 rounded-2xl p-4 text-white focus:border-blue-500 outline-none">
            </div>
            <div>
                <label class="text-blue-400 text-xs font-bold uppercase tracking-widest block mb-2">Contact No</label>
                <input type="text" name="contactNo" value="<%= res.getContactNo() %>" class="w-full bg-white/5 border border-white/10 rounded-2xl p-4 text-white focus:border-blue-500 outline-none">
            </div>

            <div>
                <label class="text-blue-400 text-xs font-bold uppercase tracking-widest block mb-2">Check In</label>
                <input type="date" name="checkIn" value="<%= res.getCheckIn() %>" class="w-full bg-white/5 border border-white/10 rounded-2xl p-4 text-white focus:border-blue-500 outline-none">
            </div>
            <div>
                <label class="text-blue-400 text-xs font-bold uppercase tracking-widest block mb-2">Check Out</label>
                <input type="date" name="checkOut" value="<%= res.getCheckOut() %>" class="w-full bg-white/5 border border-white/10 rounded-2xl p-4 text-white focus:border-blue-500 outline-none">
            </div>

            <div class="col-span-2">
                <label class="text-blue-400 text-xs font-bold uppercase tracking-widest block mb-2">Room Type</label>
                <%-- appearance-none neekappattuள்ளது dropdown arrow therivatharku --%>
                <select name="roomType" class="w-full bg-white/5 border border-white/10 rounded-2xl p-4 text-white focus:border-blue-500 outline-none">
                    <option value="Single" <%= "Single".equals(res.getRoomType()) ? "selected" : "" %>>Single Room</option>
                    <option value="Double" <%= "Double".equals(res.getRoomType()) ? "selected" : "" %>>Double Room</option>
                    <option value="Luxury" <%= "Luxury".equals(res.getRoomType()) ? "selected" : "" %>>Luxury Suite</option>
                </select>
            </div>
        </div>

        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-500 text-white font-black py-5 rounded-2xl transition-all shadow-xl uppercase tracking-widest">
            SAVE CHANGES
        </button>
    </form>
</div>
<% } else { %>
<p class="text-white text-center font-bold">Reservation not found.</p>
<% } %>
</body>
</html>