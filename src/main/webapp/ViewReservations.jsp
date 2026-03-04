<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.oceanview.model.Reservation, com.oceanview.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Details | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg { background: linear-gradient(rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.9)), url('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1920&q=80'); background-size: cover; background-attachment: fixed; }
        .glass-panel { background: rgba(255, 255, 255, 0.03); backdrop-filter: blur(20px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 30px; }
    </style>
</head>
<body class="hero-bg min-h-screen p-8">
<div class="max-w-7xl mx-auto">
    <div class="flex justify-between items-center mb-8">
        <h1 class="text-3xl text-white uppercase tracking-widest font-bold">Reservation Records</h1>
        <a href="dashboard.jsp" class="text-blue-400 hover:text-white transition-all text-xs font-black uppercase tracking-widest">
            <i class="fas fa-arrow-left mr-2"></i> Dashboard
        </a>
    </div>

    <div class="glass-panel overflow-hidden shadow-2xl">
        <table class="w-full text-left border-collapse">
            <thead>
            <tr class="bg-white/5 border-b border-white/10 text-slate-400 uppercase text-xs font-bold tracking-widest">
                <th class="p-6">Res ID</th>
                <th class="p-6">Guest</th>
                <th class="p-6">Room</th>
                <th class="p-6">Check In</th>
                <th class="p-6">Check Out</th>
                <th class="p-6 text-center">Actions</th> <%-- Action Column added --%>
            </tr>
            </thead>
            <tbody class="text-slate-300">
            <%
                ReservationDAO dao = new ReservationDAO();
                List<Reservation> bookings = dao.getAllReservations();
                if(bookings != null && !bookings.isEmpty()) {
                    for(Reservation res : bookings) {
            %>
            <tr class="border-b border-white/5 hover:bg-white/5 transition-all">
                <td class="p-6 text-blue-400 font-mono"><%= res.getResNo() %></td>
                <td class="p-6 font-semibold text-white"><%= res.getGuestName() %></td>
                <td class="p-6">
                    <span class="bg-blue-500/10 text-blue-400 px-3 py-1 rounded-full text-[10px] font-bold">
                        <%= res.getRoomType() %>
                    </span>
                </td>
                <td class="p-6"><%= res.getCheckIn() %></td>
                <td class="p-6"><%= res.getCheckOut() %></td>
                <td class="p-6 text-center">
                    <div class="flex justify-center gap-4">
                        <%-- Edit Button --%>
                        <a href="editReservation.jsp?id=<%= res.getResNo() %>" class="text-emerald-400 hover:text-emerald-300 transition-colors" title="Edit">
                            <i class="fas fa-edit"></i>
                        </a>
                        <%-- Delete Button --%>
                        <button onclick="confirmDelete('<%= res.getResNo() %>')" class="text-rose-400 hover:text-rose-300 transition-colors" title="Delete">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <%      }
            } else { %>
            <tr><td colspan="6" class="p-12 text-center text-slate-500">No reservations found.</td></tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function confirmDelete(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You want to delete reservation " + id + "?",
            icon: 'warning',
            showCancelButton: true,
            background: '#0f172a',
            color: '#fff',
            confirmButtonColor: '#ef4444',
            cancelButtonColor: '#334155',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                // Ippo delete logic-ukku servlet-ai call seiyalam
                window.location.href = 'deleteReservation?id=' + id;
            }
        })
    }
</script>

</body>
</html>