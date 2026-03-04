<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Portal | Ocean View Resort</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .sidebar-gradient { background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%); }
        .glass { background: rgba(255, 255, 255, 0.7); backdrop-filter: blur(12px); border: 1px solid rgba(255, 255, 255, 0.3); }
        .card-hover:hover { transform: translateY(-8px); transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1); box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15); }
        .brand-font { font-family: 'Cinzel', serif; letter-spacing: 4px; }
    </style>
</head>
<body class="bg-[#f8fafc] text-slate-900">

<div class="flex h-screen overflow-hidden">
    <aside class="w-72 sidebar-gradient text-white flex flex-col p-6 shadow-2xl">
        <div class="py-10 px-4 text-center border-b border-white/5 mb-8">
            <span class="brand-font text-2xl font-bold text-white block">OCEAN VIEW</span>
            <span class="text-[9px] tracking-[5px] text-blue-400 font-bold uppercase mt-2 block">Staff Portal</span>
        </div>

        <nav class="flex-1 space-y-3">
            <div class="text-[10px] font-black text-slate-500 uppercase tracking-[3px] px-4 mb-4">Core Modules</div>

            <a href="dashboard.jsp" class="flex items-center p-4 bg-blue-600/20 text-blue-400 rounded-2xl border border-blue-500/20 font-bold">
                <i class="fas fa-th-large mr-4"></i> Overview
            </a>

            <a href="Reservation.jsp" class="flex items-center p-4 text-slate-400 hover:bg-white/5 hover:text-white rounded-2xl transition-all group">
                <i class="fas fa-calendar-plus mr-4 group-hover:text-blue-400"></i> Add Reservation
            </a>

            <a href="ViewReservations.jsp" class="flex items-center p-4 text-slate-400 hover:bg-white/5 hover:text-white rounded-2xl transition-all group">
                <i class="fas fa-address-book mr-4 group-hover:text-blue-400"></i> Guest Directory
            </a>

            <%-- UPDATED: Points to the new search form to enter Res ID --%>
            <a href="billing.jsp" class="flex items-center p-4 text-slate-400 hover:bg-white/5 hover:text-white rounded-2xl transition-all group">
                <i class="fas fa-file-invoice-dollar mr-4 group-hover:text-blue-400"></i> Billing Engine
            </a>

            <a href="help.jsp" class="flex items-center p-4 text-slate-400 hover:bg-white/5 hover:text-white rounded-2xl transition-all group">
                <i class="fas fa-circle-question mr-4 group-hover:text-blue-400"></i> Help Section
            </a>
        </nav>

        <div class="pt-6 border-t border-white/5 mt-auto">
            <a href="logout" class="flex items-center p-4 text-rose-400 hover:bg-rose-500/10 rounded-2xl transition-all font-bold">
                <i class="fas fa-door-open mr-4"></i> Exit System
            </a>
        </div>
    </aside>

    <main class="flex-1 flex flex-col relative overflow-y-auto">
        <header class="h-24 glass sticky top-0 z-20 flex items-center justify-between px-12 border-b border-slate-200">
            <div>
                <h1 class="text-xl font-extrabold text-slate-800 tracking-tight">Operational Dashboard</h1>
                <p class="text-[10px] text-slate-500 font-bold uppercase tracking-widest mt-1">Management Console <i class="fas fa-chevron-right mx-2 text-[7px]"></i> Galle Branch</p>
            </div>

            <div class="flex items-center gap-6">
                <div class="text-right border-r pr-6 border-slate-200">
                    <p class="text-[9px] font-black text-slate-400 uppercase tracking-tighter">Authorized Admin</p>
                    <p class="text-sm font-bold text-blue-600"><%= session.getAttribute("user") != null ? session.getAttribute("user") : "Guest User" %></p>
                </div>
                <div class="w-12 h-12 rounded-2xl bg-slate-900 flex items-center justify-center text-white shadow-lg">
                    <i class="fas fa-user-shield text-lg"></i>
                </div>
            </div>
        </header>

        <div class="p-12">
            <div class="mb-12">
                <h2 class="text-4xl font-black text-slate-900 tracking-tight">Welcome, Ocean View Team!</h2>
                <p class="text-slate-500 mt-3 text-lg">Seamlessly manage guest lifecycle from check-in to final settlement.</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-10">
                <a href="Reservation.jsp" class="bg-white p-10 rounded-[45px] shadow-sm border border-slate-100 card-hover group relative overflow-hidden">
                    <div class="w-16 h-16 bg-blue-50 rounded-3xl flex items-center justify-center text-blue-600 mb-8 group-hover:bg-blue-600 group-hover:text-white transition-all duration-500">
                        <i class="fas fa-plus-circle text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-800 mb-4">Add Reservation</h3>
                    <p class="text-slate-500 text-sm leading-relaxed mb-8">Store guest details, room types, and check-in/out dates securely.</p>
                    <div class="flex items-center text-blue-600 font-black text-xs uppercase tracking-widest">
                        Initialize Booking <i class="fas fa-arrow-right ml-3 group-hover:translate-x-2 transition-transform"></i>
                    </div>
                </a>

                <a href="ViewReservations.jsp" class="bg-white p-10 rounded-[45px] shadow-sm border border-slate-100 card-hover group relative overflow-hidden">
                    <div class="w-16 h-16 bg-indigo-50 rounded-3xl flex items-center justify-center text-indigo-600 mb-8 group-hover:bg-indigo-600 group-hover:text-white transition-all duration-500">
                        <i class="fas fa-magnifying-glass-chart text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-800 mb-4">View Details</h3>
                    <p class="text-slate-500 text-sm leading-relaxed mb-8">Retrieve comprehensive guest information via Reservation ID.</p>
                    <div class="flex items-center text-indigo-600 font-black text-xs uppercase tracking-widest">
                        Open Directory <i class="fas fa-arrow-right ml-3 group-hover:translate-x-2 transition-transform"></i>
                    </div>
                </a>

                <%-- UPDATED: Redirects to the search form where you input Res ID manually --%>
                <a href="billing.jsp" class="bg-white p-10 rounded-[45px] shadow-sm border border-slate-100 card-hover group relative overflow-hidden">
                    <div class="w-16 h-16 bg-emerald-50 rounded-3xl flex items-center justify-center text-emerald-600 mb-8 group-hover:bg-emerald-600 group-hover:text-white transition-all duration-500">
                        <i class="fas fa-receipt text-2xl"></i>
                    </div>
                    <h3 class="text-xl font-black text-slate-800 mb-4">Billing & Invoicing</h3>
                    <p class="text-slate-500 text-sm leading-relaxed mb-8">Compute stay costs and generate professional invoice reports.</p>
                    <div class="flex items-center text-emerald-600 font-black text-xs uppercase tracking-widest">
                        Generate Bill <i class="fas fa-arrow-right ml-3 group-hover:translate-x-2 transition-transform"></i>
                    </div>
                </a>
            </div>

            <div class="mt-14 relative overflow-hidden bg-slate-900 rounded-[45px] p-12 text-white shadow-2xl shadow-slate-200">
                <div class="relative z-10 flex flex-col md:flex-row items-center justify-between gap-10">
                    <div class="max-w-2xl">
                        <div class="flex items-center gap-4 mb-6">
                            <span class="px-4 py-1 bg-blue-500 text-[10px] font-black uppercase tracking-widest rounded-full">New Staff Guide</span>
                        </div>
                        <h3 class="text-3xl font-bold mb-4">Need System Assistance?</h3>
                        <p class="text-slate-400 text-lg">Detailed documentation on room allocation and system navigation.</p>
                    </div>
                    <a href="help.jsp" class="bg-white text-slate-900 px-12 py-5 rounded-[24px] font-black hover:bg-blue-600 hover:text-white transition-all shadow-xl text-sm uppercase tracking-widest">
                        Open Help Manual
                    </a>
                </div>
            </div>
        </div>
    </main>
</div>

</body>
</html>