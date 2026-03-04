<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Portal | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg {
            background: linear-gradient(rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.9)),
            url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 40px;
        }
        .input-field {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
        }
        .input-field:focus {
            border-color: #2563eb;
            background: rgba(255, 255, 255, 0.1);
            outline: none;
        }
        /* Animation Styles */
        .loading-spinner {
            display: none;
            border: 3px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top: 3px solid white;
            width: 18px;
            height: 18px;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
    <script>
        function startLoading() {
            const btn = document.getElementById('submitBtn');
            const btnText = document.getElementById('btnText');
            const spinner = document.getElementById('spinner');

            // UI Maatram
            btnText.innerText = "Generating...";
            spinner.style.display = "inline-block";
            btn.classList.add('opacity-80', 'cursor-not-allowed');
            return true;
        }
    </script>
</head>
<body class="hero-bg min-h-screen flex items-center justify-center p-8">

<div class="w-full max-w-lg">
    <div class="mb-6">
        <a href="<%= request.getContextPath() %>/dashboard.jsp" class="inline-flex items-center text-blue-400 hover:text-white transition-all text-[10px] font-black uppercase tracking-[2px]">
            <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
        </a>
    </div>

    <div class="glass-panel p-10 md:p-14 shadow-2xl">
        <div class="text-center mb-10">
            <div class="w-16 h-16 bg-blue-600/20 rounded-2xl flex items-center justify-center mx-auto mb-6 border border-blue-600/30">
                <i class="fas fa-file-invoice-dollar text-blue-400 text-2xl"></i>
            </div>
            <h1 class="text-2xl text-white uppercase tracking-widest font-bold">Billing Portal</h1>
            <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[2px] mt-2">Ocean View Resort Galle</p>
        </div>

        <form action="<%= request.getContextPath() %>/generateInvoice.jsp" method="GET" onsubmit="return startLoading()" class="space-y-8">
            <div class="space-y-3">
                <label class="text-xs text-slate-500 uppercase font-bold ml-1">Reservation Identifier</label>
                <div class="relative">
                    <i class="fas fa-hashtag absolute left-5 top-1/2 -translate-y-1/2 text-slate-500"></i>
                    <input type="text" name="id" placeholder="RES-000" required
                           class="input-field w-full pl-12 pr-6 py-4 rounded-xl font-semibold placeholder:text-slate-600">
                </div>
            </div>

            <button type="submit" id="submitBtn" class="w-full bg-blue-600 text-white font-bold p-4 rounded-2xl hover:bg-blue-500 transition-all uppercase tracking-widest active:scale-95 shadow-lg shadow-blue-600/20 flex items-center justify-center gap-3">
                <span id="btnText">Process Invoice</span>
                <div id="spinner" class="loading-spinner"></div>
                <i id="btnIcon" class="fas fa-chevron-right text-xs"></i>
            </button>
        </form>
    </div>

    <div class="mt-8 flex justify-center items-center gap-4 opacity-30">
        <div class="flex items-center gap-2 text-[9px] font-black text-white uppercase tracking-widest">
            <i class="fas fa-shield-alt text-blue-500"></i> SSL Secure
        </div>
        <div class="w-1 h-1 bg-slate-600 rounded-full"></div>
        <div class="flex items-center gap-2 text-[9px] font-black text-white uppercase tracking-widest">
            <i class="fas fa-database text-blue-500"></i> Real-time Sync
        </div>
    </div>
</div>

</body>
</html>