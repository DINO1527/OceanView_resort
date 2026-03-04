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
            background-color: #1e293b;
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

    <div id="statusMessage" class="hidden w-full p-4 mb-6 rounded-2xl text-center font-bold transition-all duration-500"></div>

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
                <select name="roomType" class="w-full bg-white/5 border border-white/10 rounded-2xl p-4 text-white focus:border-blue-500 outline-none">
                    <option value="Single" <%= "Single".equals(res.getRoomType()) ? "selected" : "" %>>Single Room</option>
                    <option value="Double" <%= "Double".equals(res.getRoomType()) ? "selected" : "" %>>Double Room</option>
                    <option value="Luxury" <%= "Luxury".equals(res.getRoomType()) ? "selected" : "" %>>Luxury Suite</option>
                </select>
            </div>
        </div>

        <div class="flex flex-col gap-4">
            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-500 text-white font-black py-5 rounded-2xl transition-all shadow-xl uppercase tracking-widest">
                SAVE CHANGES
            </button>

            <a href="ViewReservations.jsp" class="w-full text-center text-white/60 hover:text-white font-bold py-2 transition-all uppercase tracking-widest text-sm">
                ← Back to Reservations
            </a>
        </div>
    </form>
</div>
<% } else { %>
<div class="text-center">
    <p class="text-white text-xl font-bold mb-4">Reservation not found.</p>
    <a href="ViewReservations.jsp" class="text-blue-400 underline">Go back to list</a>
</div>
<% } %>

<script>
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get('status');
    const msgBox = document.getElementById('statusMessage');

    if (status === 'success') {
        msgBox.innerText = "🎉 Changes Saved Successfully!";
        msgBox.classList.remove('hidden');
        msgBox.classList.add('bg-green-500/20', 'text-green-400', 'border', 'border-green-500/30');

        // Hide after 3 seconds
        setTimeout(() => {
            msgBox.style.opacity = '0';
            setTimeout(() => {
                msgBox.classList.add('hidden');
                // Clean URL
                window.history.replaceState({}, document.title, window.location.pathname + "?id=<%= resNo %>");
            }, 500);
        }, 3000);

    } else if (status === 'error' || status === 'exception') {
        msgBox.innerText = "❌ Error! Could not update reservation.";
        msgBox.classList.remove('hidden');
        msgBox.classList.add('bg-red-500/20', 'text-red-400', 'border', 'border-red-500/30');
    }
</script>

</body>
</html>