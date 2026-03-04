<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Billing Engine | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-slate-900 min-h-screen flex items-center justify-center p-6">

<div class="max-w-md w-full bg-white rounded-[40px] p-10 shadow-2xl">
    <div class="text-center mb-10">
        <div class="w-20 h-20 bg-emerald-100 text-emerald-600 rounded-3xl flex items-center justify-center mx-auto mb-6 text-3xl">
            <i class="fas fa-file-invoice-dollar"></i>
        </div>
        <h2 class="text-3xl font-black text-slate-800 tracking-tight">Billing Engine</h2>
        <p class="text-slate-500 mt-2">Enter Reservation ID to generate invoice</p>
    </div>

    <form action="generateInvoice.jsp" method="GET" class="space-y-6">
        <div>
            <label class="block text-xs font-black uppercase tracking-widest text-slate-400 mb-3 ml-1">Reservation ID</label>
            <div class="relative">
                <i class="fas fa-hashtag absolute left-5 top-1/2 -translate-y-1/2 text-slate-400"></i>
                <input type="text" name="id" placeholder="e.g. RES-001" required
                       class="w-full pl-12 pr-6 py-4 bg-slate-50 border-2 border-slate-100 rounded-2xl focus:border-emerald-500 focus:ring-0 transition-all outline-none font-bold text-slate-700">
            </div>
        </div>

        <button type="submit" class="w-full bg-emerald-600 text-white py-5 rounded-2xl font-black uppercase tracking-widest hover:bg-emerald-700 shadow-lg shadow-emerald-200 transition-all flex items-center justify-center gap-3">
            Generate Invoice <i class="fas fa-arrow-right"></i>
        </button>

        <a href="dashboard.jsp" class="block text-center text-slate-400 font-bold text-sm hover:text-slate-600 transition-all mt-4">
            Back to Dashboard
        </a>
    </form>
</div>

</body>
</html>