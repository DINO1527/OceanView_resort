<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Unique Reservation ID generation logic
    String autoResNo = "RES-" + (System.currentTimeMillis() % 10000000);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>New Reservation | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg { background: linear-gradient(rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.9)), url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80'); background-size: cover; background-attachment: fixed; }
        .glass-panel { background: rgba(255, 255, 255, 0.03); backdrop-filter: blur(20px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 40px; }
        .input-field { background: rgba(255, 255, 255, 0.05); border: 1px solid rgba(255, 255, 255, 0.1); color: white; }
    </style>
</head>
<body class="hero-bg min-h-screen flex items-center justify-center p-8">
<div class="w-full max-w-4xl">

    <div class="mb-6">
        <a href="dashboard.jsp" class="inline-flex items-center text-blue-400 hover:text-white transition-all text-[10px] font-black uppercase tracking-[2px]">
            <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
        </a>
    </div>

    <div class="glass-panel p-8 md:p-12 shadow-2xl">
        <h1 class="text-3xl text-white text-center mb-8 uppercase tracking-widest">New Reservation</h1>

        <%-- Status and Error Messages Handled by SweetAlert --%>
        <%
            String status = request.getParameter("status");
            String error = (String) request.getAttribute("errorMessage");
        %>

        <form action="<%= request.getContextPath() %>/addReservation" method="POST" class="space-y-6" onsubmit="return validateDates()">
            <div class="grid grid-cols-2 gap-6">
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Reservation ID</label>
                    <input type="text" name="resNo" value="<%= autoResNo %>" readonly class="input-field w-full p-4 rounded-xl outline-none opacity-70">
                </div>
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Guest Full Name</label>
                    <input type="text" name="guestName" required class="input-field w-full p-4 rounded-xl outline-none" placeholder="Enter Name">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-6">
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Contact Number</label>
                    <input type="tel" name="contactNo" placeholder="Phone Number" required class="input-field w-full p-4 rounded-xl outline-none">
                </div>
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Guest Address</label>
                    <input type="text" name="address" placeholder="Residential Address" required class="input-field w-full p-4 rounded-xl outline-none">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-6">
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Room Selection</label>
                    <select name="roomType" required class="input-field w-full p-4 rounded-xl outline-none bg-slate-900">
                        <option value="" disabled selected>Select Room</option>
                        <option value="Standard Room">Standard Room</option>
                        <option value="Deluxe Ocean View">Deluxe Ocean View</option>
                        <option value="Family Suite">Family Suite</option>
                        <option value="Luxury Suite">Luxury Suite</option>
                        <option value="Presidential Penthouse">Presidential Penthouse</option>
                    </select>
                </div>
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Check-In</label>
                    <input type="date" name="checkIn" id="checkIn" required class="input-field w-full p-4 rounded-xl">
                </div>
                <div>
                    <label class="text-xs text-slate-500 uppercase font-bold ml-1">Check-Out</label>
                    <input type="date" name="checkOut" id="checkOut" required class="input-field w-full p-4 rounded-xl">
                </div>
            </div>

            <button type="submit" class="w-full bg-blue-600 text-white font-bold p-4 rounded-2xl hover:bg-blue-500 transition-all uppercase tracking-widest active:scale-95 shadow-lg shadow-blue-600/20">
                Finalize Booking <i class="fas fa-check ml-2"></i>
            </button>
        </form>
    </div>
</div>

<script>
    // --- POPUP NOTIFICATION LOGIC ---
    window.onload = function() {
        <% if("success".equals(status)) { %>
        Swal.fire({
            title: 'Success!',
            text: 'Reservation confirmed successfully!',
            icon: 'success',
            background: '#0f172a',
            color: '#fff',
            timer: 3000,
            showConfirmButton: false,
            timerProgressBar: true
        });
        <% } else if(error != null) { %>
        Swal.fire({
            title: 'Error!',
            text: '<%= error %>',
            icon: 'error',
            background: '#0f172a',
            color: '#fff',
            confirmButtonColor: '#3b82f6'
        });
        <% } %>
    };

    // --- DATE VALIDATION LOGIC ---
    function validateDates() {
        const checkIn = document.getElementById('checkIn').value;
        const checkOut = document.getElementById('checkOut').value;

        if (new Date(checkOut) <= new Date(checkIn)) {
            Swal.fire({
                icon: 'warning',
                title: 'Invalid Date',
                text: 'Check-out date must be after the check-in date!',
                background: '#0f172a',
                color: '#fff'
            });
            return false;
        }
        return true;
    }

    const today = new Date().toISOString().split('T')[0];
    document.getElementById('checkIn').setAttribute('min', today);
</script>

</body>
</html>