<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration | Ocean View Resort</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Plus+Jakarta+Sans:wght@300;400;600;700;800&family=Playfair+Display:ital,wght@1,900&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg {
            background: linear-gradient(rgba(15, 23, 42, 0.75), rgba(15, 23, 42, 0.75)),
            url('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .brand-font {
            font-family: 'Cinzel', serif;
            letter-spacing: 10px;
            color: #ffffff;
            animation: subtle-float 5s ease-in-out infinite alternate;
        }
        @keyframes subtle-float {
            from { transform: translateY(0); opacity: 0.9; }
            to { transform: translateY(-5px); opacity: 1; }
        }
        .transparent-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(30px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 40px;
        }
        .signin-text { font-family: 'Playfair Display', serif; font-style: italic; }
        .input-glass {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s ease;
        }
        .input-glass:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #3b82f6;
            outline: none;
        }
    </style>
</head>
<body class="hero-bg min-h-screen flex items-center justify-center p-6">

<div class="w-full max-w-xl">
    <div class="text-center mb-10">
        <h1 class="brand-font text-3xl md:text-4xl">OCEAN VIEW</h1>
        <div class="h-[2px] w-16 bg-blue-500 mx-auto mt-4 rounded-full"></div>
        <p class="text-slate-400 text-[9px] font-bold uppercase tracking-[8px] mt-6">Staff Management System</p>
    </div>

    <div class="transparent-card p-8 md:p-12">
        <div class="mb-8 text-center md:text-left">
            <h2 class="signin-text text-5xl text-white">Sign <span class="text-blue-500">Up</span></h2>
            <div class="inline-block mt-4 px-3 py-1 bg-blue-500/20 border border-blue-500/30 rounded-full">
                <p class="text-blue-400 text-[9px] font-black uppercase tracking-widest leading-none">Access Role: System Admin</p>
            </div>
        </div>

        <form action="<%= request.getContextPath() %>/signup" method="POST" class="space-y-6">
            <input type="hidden" name="department" value="Management">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-2">
                    <label class="text-[9px] font-black text-slate-500 uppercase tracking-widest ml-1">Admin Name</label>
                    <input type="text" name="fullName" value="<%= request.getAttribute("fullName") != null ? request.getAttribute("fullName") : "" %>" required
                           class="input-glass w-full px-6 py-4 rounded-2xl font-medium text-sm" placeholder="Full Name">
                </div>
                <div class="space-y-2">
                    <label class="text-[9px] font-black text-slate-500 uppercase tracking-widest ml-1">Admin Email</label>
                    <input type="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required
                           class="input-glass w-full px-6 py-4 rounded-2xl font-medium text-sm" placeholder="admin@oceanview.com">
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-2">
                    <label class="text-[9px] font-black text-slate-500 uppercase tracking-widest ml-1">Secret Password</label>
                    <div class="relative">
                        <input type="password" id="pass1" name="password" required
                               class="input-glass w-full pl-6 pr-12 py-4 rounded-2xl font-medium text-sm" placeholder="••••••••">
                        <button type="button" onclick="toggle('pass1', 'eye1')" class="absolute inset-y-0 right-0 pr-4 flex items-center text-slate-500">
                            <i id="eye1" class="fas fa-eye-slash text-xs"></i>
                        </button>
                    </div>
                </div>
                <div class="space-y-2">
                    <label class="text-[9px] font-black text-slate-500 uppercase tracking-widest ml-1">Confirm Secret</label>
                    <div class="relative">
                        <input type="password" id="pass2" name="confirmPassword" required
                               class="input-glass w-full pl-6 pr-12 py-4 rounded-2xl font-medium text-sm" placeholder="••••••••">
                        <button type="button" onclick="toggle('pass2', 'eye2')" class="absolute inset-y-0 right-0 pr-4 flex items-center text-slate-500">
                            <i id="eye2" class="fas fa-eye-slash text-xs"></i>
                        </button>
                    </div>
                </div>
            </div>

            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-500 text-white font-black py-5 rounded-[28px] shadow-2xl shadow-blue-600/30 transition-all active:scale-95 flex items-center justify-center gap-3 mt-4 text-[11px] uppercase tracking-[4px]">
                Create Admin Account <i class="fas fa-shield-check text-[10px]"></i>
            </button>
        </form>

        <div class="mt-10 pt-8 border-t border-white/5 text-center">
            <p class="text-[11px] text-slate-500 font-bold uppercase">Already have access? <a href="<%= request.getContextPath() %>/login" class="text-blue-400 hover:underline ml-1 font-black">Admin Sign In</a></p>
        </div>
    </div>
</div>

<script>
    function toggle(id, eyeId) {
        const f = document.getElementById(id), i = document.getElementById(eyeId);
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