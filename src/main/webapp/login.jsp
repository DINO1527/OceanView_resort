<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login | Ocean View Resort</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Plus+Jakarta+Sans:wght@300;400;600;700;800&family=Playfair+Display:ital,wght@1,900&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }

        /* High-Resolution Luxury Background */
        .hero-bg {
            background: linear-gradient(rgba(15, 23, 42, 0.7), rgba(15, 23, 42, 0.7)),
            url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Professional Resort Name (Cinzel Font) */
        .brand-font {
            font-family: 'Cinzel', serif;
            letter-spacing: 10px;
            color: #ffffff;
            text-shadow: 0 4px 15px rgba(0,0,0,0.5);
            animation: subtle-float 5s ease-in-out infinite alternate;
        }

        @keyframes subtle-float {
            from { transform: translateY(0); opacity: 0.9; }
            to { transform: translateY(-5px); opacity: 1; }
        }

        /* Transparent Glass Design */
        .transparent-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(30px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 40px;
            box-shadow: 0 40px 100px -20px rgba(0, 0, 0, 0.6);
        }

        /* Two-Color Sign In */
        .signin-text {
            font-family: 'Playfair Display', serif;
            font-style: italic;
        }

        .input-glass {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
        }

        .input-glass:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #3b82f6;
            box-shadow: 0 0 15px rgba(59, 130, 246, 0.3);
            outline: none;
        }

        .input-glass::placeholder { color: rgba(255, 255, 255, 0.4); }
    </style>
</head>
<body class="hero-bg min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-md">
    <div class="text-center mb-14">
        <h1 class="brand-font text-3xl md:text-4xl">
            OCEAN VIEW
        </h1>
        <div class="h-[2px] w-16 bg-blue-500 mx-auto mt-4 rounded-full shadow-[0_0_10px_#3b82f6]"></div>
        <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[8px] mt-6">Staff Management System</p>
    </div>

    <div class="transparent-card p-10 md:p-14">
        <div class="mb-12">
            <h2 class="signin-text text-5xl text-white">
                Sign <span class="text-blue-500">In</span>
            </h2>
            <p class="text-slate-500 text-[10px] font-black uppercase tracking-[4px] mt-4 ml-1">Secure Staff Gateway</p>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="mb-8 p-4 bg-rose-500/10 border border-rose-500/20 text-rose-400 rounded-2xl flex items-center gap-3 text-xs font-bold uppercase tracking-widest">
            <i class="fas fa-fingerprint"></i> <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %>

        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="mb-8 p-4 bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 rounded-2xl flex items-center gap-3 text-xs font-bold uppercase tracking-widest">
            <i class="fas fa-check-circle"></i> <%= request.getAttribute("successMessage") %>
        </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/login" method="POST" class="space-y-8">
            <div class="space-y-3">
                <label class="text-[9px] font-black text-slate-500 uppercase tracking-[3px] ml-2">Username / Email</label>
                <div class="relative group">
                        <span class="absolute inset-y-0 left-0 pl-6 flex items-center text-slate-500 group-focus-within:text-blue-400">
                            <i class="fas fa-user-tie"></i>
                        </span>
                    <input type="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required
                           class="input-glass w-full pl-14 pr-6 py-5 rounded-[28px] font-medium text-sm"
                           placeholder="staff@oceanview.com">
                </div>
            </div>

            <div class="space-y-3">
                <label class="text-[9px] font-black text-slate-500 uppercase tracking-[3px] ml-2">Access Key</label>
                <div class="relative group">
                        <span class="absolute inset-y-0 left-0 pl-6 flex items-center text-slate-500 group-focus-within:text-blue-400">
                            <i class="fas fa-shield-halved"></i>
                        </span>
                    <input type="password" id="staffPass" name="password" required
                           class="input-glass w-full pl-14 pr-14 py-5 rounded-[28px] font-medium text-sm"
                           placeholder="••••••••">
                    <button type="button" onclick="togglePass()" class="absolute inset-y-0 right-0 pr-6 flex items-center text-slate-500 hover:text-white">
                        <i id="toggleIco" class="fas fa-eye-slash text-sm"></i>
                    </button>
                </div>
            </div>

            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-500 text-white font-black py-5 rounded-[28px] shadow-2xl shadow-blue-600/30 transition-all active:scale-95 flex items-center justify-center gap-3 mt-4 text-[11px] uppercase tracking-[4px]">
                Authorize Access <i class="fas fa-chevron-right text-[10px]"></i>
            </button>
        </form>

        <div class="mt-14 pt-8 border-t border-white/5 text-center">
            <p class="text-[11px] text-slate-500 font-bold uppercase">
                New Employee? <a href="<%= request.getContextPath() %>/signup" class="text-blue-400 hover:underline ml-1 tracking-normal font-black">Request Login</a>
            </p>
            <p class="mt-8 text-[9px] font-black tracking-[6px] text-slate-700 uppercase italic">Ocean View Resort © 2026</p>
        </div>
    </div>
</div>

<script>
    function togglePass() {
        const f = document.getElementById('staffPass'), i = document.getElementById('toggleIco');
        if (f.type === 'password') {
            f.type = 'text';
            i.classList.replace('fa-eye-slash', 'fa-eye');
        } else {
            f.type = 'password';
            i.classList.replace('fa-eye', 'fa-eye-slash');
        }
    }
</script>
</body>
</html>