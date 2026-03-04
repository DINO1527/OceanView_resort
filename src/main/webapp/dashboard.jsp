<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<div class="flex h-screen bg-slate-50">
    <aside class="w-64 bg-slate-900 text-white flex flex-col p-6 shadow-xl">
        <h2 class="text-2xl font-bold mb-10 text-blue-400">OCEAN VIEW</h2>
        <nav class="space-y-4">
            <a href="#" class="flex items-center p-3 bg-blue-600 rounded-lg"><i class="fas fa-home mr-3"></i> Dashboard</a>
            <a href="add-reservation.jsp" class="flex items-center p-3 hover:bg-slate-800 rounded-lg"><i class="fas fa-plus mr-3"></i> New Booking</a>
            <a href="view-details.jsp" class="flex items-center p-3 hover:bg-slate-800 rounded-lg"><i class="fas fa-list mr-3"></i> Reservations</a>
            <a href="billing.jsp" class="flex items-center p-3 hover:bg-slate-800 rounded-lg"><i class="fas fa-file-invoice-dollar mr-3"></i> Billing</a>
        </nav>
    </aside>

    <main class="flex-1 p-10">
        <header class="flex justify-between items-center mb-10">
            <h1 class="text-3xl font-bold text-slate-800">Staff Dashboard</h1>
            <div class="text-slate-600 font-semibold italic">Welcome, <%= session.getAttribute("user") %>!</div>
        </header>
    </main>
</div>