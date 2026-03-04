<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Help Center | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg {
            background: linear-gradient(rgba(15, 23, 42, 0.95), rgba(15, 23, 42, 0.95)),
            url('https://images.unsplash.com/photo-1454165833767-027eeef1596e?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
        }
        .help-card {
            background: rgba(255, 255, 255, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: all 0.3s ease;
        }
        .help-card:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(59, 130, 246, 0.3);
        }
    </style>
</head>
<body class="hero-bg min-h-screen p-6 md:p-12 text-slate-300">

<div class="max-w-5xl mx-auto">
    <div class="flex justify-between items-center mb-12">
        <div>
            <h1 class="text-3xl text-white font-bold tracking-tight">Staff Knowledge Base</h1>
            <p class="text-blue-400 text-xs font-black uppercase tracking-[3px] mt-2">Ocean View System Guidelines</p>
        </div>
        <a href="dashboard.jsp" class="bg-white/5 hover:bg-white/10 px-5 py-3 rounded-xl border border-white/10 text-white transition-all text-[10px] font-black uppercase tracking-widest">
            <i class="fas fa-times mr-2"></i> Close Help
        </a>
    </div>

    <div class="grid gap-6">
        <div class="glass-panel p-8">
            <div class="flex items-start gap-6">
                <div class="w-12 h-12 bg-blue-600/20 rounded-2xl flex items-center justify-center shrink-0 border border-blue-600/30">
                    <i class="fas fa-key text-blue-400"></i>
                </div>
                <div>
                    <h2 class="text-xl text-white font-bold mb-4">1. Getting Started</h2>
                    <ul class="space-y-3 text-sm leading-relaxed">
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> Use your staff credentials to log in through the secure portal.</li>
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> The Dashboard gives you a real-time overview of current bookings and room availability.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="glass-panel p-8">
            <div class="flex items-start gap-6">
                <div class="w-12 h-12 bg-purple-600/20 rounded-2xl flex items-center justify-center shrink-0 border border-purple-600/30">
                    <i class="fas fa-plus-circle text-purple-400"></i>
                </div>
                <div>
                    <h2 class="text-xl text-white font-bold mb-4">2. Creating a Reservation</h2>
                    <ul class="space-y-3 text-sm leading-relaxed">
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> Navigate to <b>"New Booking"</b> and enter guest details accurately.</li>
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> Select the room type and verify Check-in/Check-out dates before saving.</li>
                        <li class="flex gap-3"><i class="fas fa-exclamation-triangle text-amber-500 mt-1"></i> Ensure the Room ID is not already occupied for those dates.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="glass-panel p-8">
            <div class="flex items-start gap-6">
                <div class="w-12 h-12 bg-emerald-600/20 rounded-2xl flex items-center justify-center shrink-0 border border-emerald-600/30">
                    <i class="fas fa-file-invoice-dollar text-emerald-400"></i>
                </div>
                <div>
                    <h2 class="text-xl text-white font-bold mb-4">3. Billing & Checkout</h2>
                    <ul class="space-y-3 text-sm leading-relaxed">
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> Go to <b>"Billing Portal"</b> and enter the Reservation ID.</li>
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> Click <b>"Process Invoice"</b> to generate the final bill for the guest.</li>
                        <li class="flex gap-3"><i class="fas fa-check-circle text-emerald-500 mt-1"></i> Verify all additional service charges before printing.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="mt-8 p-8 border border-dashed border-white/10 rounded-3xl text-center">
            <p class="text-xs font-bold uppercase tracking-widest text-slate-500 mb-4">Need technical assistance?</p>
            <div class="flex justify-center gap-8">
                <div class="flex items-center gap-2 text-sm">
                    <i class="fas fa-envelope text-blue-400"></i> it-support@oceanview.com
                </div>
                <div class="flex items-center gap-2 text-sm">
                    <i class="fas fa-phone text-blue-400"></i> Ext: 104 (Internal)
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>