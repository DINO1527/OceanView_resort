<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.oceanview.model.Reservation, com.oceanview.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Details | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg {
            background: linear-gradient(rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.9)),
            url('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
        }
        .search-input {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
        }
        .search-input:focus {
            border-color: #2563eb;
            background: rgba(255, 255, 255, 0.1);
            outline: none;
        }
    </style>
</head>
<body class="hero-bg min-h-screen p-8">
<div class="max-w-7xl mx-auto">

    <div class="flex flex-col md:flex-row justify-between items-center mb-10 gap-6">
        <div>
            <h1 class="text-3xl text-white uppercase tracking-widest font-bold">Reservation Records</h1>
            <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[2px] mt-1">Manage Ocean View Guests</p>
        </div>

        <div class="flex items-center gap-6 w-full md:w-auto">
            <div class="relative w-full md:w-80">
                <i class="fas fa-search absolute left-4 top-1/2 -translate-y-1/2 text-slate-500 text-sm"></i>
                <input type="text" id="searchInput" onkeyup="filterTable()"
                       placeholder="Search Name or ID..."
                       class="search-input w-full pl-12 pr-4 py-3 rounded-xl text-sm font-semibold placeholder:text-slate-600">
            </div>

            <a href="dashboard.jsp" class="whitespace-nowrap bg-white/5 hover:bg-white/10 px-5 py-3 rounded-xl border border-white/10 text-blue-400 hover:text-white transition-all text-[10px] font-black uppercase tracking-widest">
                <i class="fas fa-arrow-left mr-2"></i> Dashboard
            </a>
        </div>
    </div>

    <div class="glass-panel overflow-hidden shadow-2xl">
        <table class="w-full text-left border-collapse" id="reservationTable">
            <thead>
            <tr class="bg-white/5 border-b border-white/10 text-slate-400 uppercase text-xs font-bold tracking-widest">
                <th class="p-6">Res ID</th>
                <th class="p-6">Guest</th>
                <th class="p-6">Room</th>
                <th class="p-6">Check In</th>
                <th class="p-6">Check Out</th>
                <th class="p-6 text-center">Actions</th>
            </tr>
            </thead>
            <tbody class="text-slate-300">
            <%
                ReservationDAO dao = new ReservationDAO();
                List<Reservation> bookings = dao.getAllReservations();
                if(bookings != null && !bookings.isEmpty()) {
                    for(Reservation res : bookings) {
            %>
            <tr class="border-b border-white/5 hover:bg-white/5 transition-all table-row">
                <td class="p-6 text-blue-400 font-mono font-bold"><%= res.getResNo() %></td>
                <td class="p-6 font-semibold text-white guest-name"><%= res.getGuestName() %></td>
                <td class="p-6">
                    <span class="bg-blue-500/10 text-blue-400 px-3 py-1 rounded-full text-[10px] font-bold">
                        <%= res.getRoomType() %>
                    </span>
                </td>
                <td class="p-6"><%= res.getCheckIn() %></td>
                <td class="p-6"><%= res.getCheckOut() %></td>
                <td class="p-6 text-center">
                    <div class="flex justify-center gap-4">
                        <a href="editReservation.jsp?id=<%= res.getResNo() %>" class="text-emerald-400 hover:text-emerald-300 transition-colors" title="Edit">
                            <i class="fas fa-edit"></i>
                        </a>
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
    // Live Search Logic
    function filterTable() {
        const input = document.getElementById("searchInput");
        const filter = input.value.toUpperCase();
        const table = document.getElementById("reservationTable");
        const tr = table.getElementsByClassName("table-row");

        for (let i = 0; i < tr.length; i++) {
            // Index 0 is ID, Index 1 is Guest Name
            const idCol = tr[i].getElementsByTagName("td")[0];
            const nameCol = tr[i].getElementsByTagName("td")[1];

            if (idCol || nameCol) {
                const idValue = idCol.textContent || idCol.innerText;
                const nameValue = nameCol.textContent || nameCol.innerText;

                if (idValue.toUpperCase().indexOf(filter) > -1 || nameValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

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
                window.location.href = 'deleteReservation?id=' + id;
            }
        })
    }
</script>
</body>
</html>