<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Staff Settings | Ocean View Resort</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Plus Jakarta Sans', sans-serif;
      background: radial-gradient(circle at top right, #1e293b, #0f172a);
    }
    .glass-card {
      background: rgba(255, 255, 255, 0.03);
      backdrop-filter: blur(25px);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }
    .input-dark {
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid rgba(255, 255, 255, 0.1);
      color: white;
      transition: all 0.3s ease;
    }
    .input-dark:focus {
      background: rgba(255, 255, 255, 0.1);
      border-color: #3b82f6;
      outline: none;
      box-shadow: 0 0 20px rgba(59, 130, 246, 0.2);
    }
    .success-animation { animation: slideDown 0.4s ease-out; }
    @keyframes slideDown { from { transform: translateY(-20px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }

    /* Custom Scrollbar for the whole page */
    ::-webkit-scrollbar { width: 5px; }
    ::-webkit-scrollbar-track { background: transparent; }
    ::-webkit-scrollbar-thumb { background: rgba(59, 130, 246, 0.5); border-radius: 10px; }
  </style>
</head>
<body class="min-h-screen flex items-center justify-center p-6">

<div class="max-w-md w-full glass-card rounded-[45px] shadow-2xl p-10 relative overflow-hidden border border-white/10">

  <div class="absolute -top-24 -left-24 w-48 h-48 bg-blue-600/20 blur-[80px] rounded-full"></div>

  <% if(request.getAttribute("message") != null) {
    String msg = (String)request.getAttribute("message");
    boolean isError = msg.toLowerCase().contains("failed") || msg.toLowerCase().contains("wrong") || msg.toLowerCase().contains("error");
  %>
  <div id="statusMessage" class="success-animation mb-8 p-4 <%= isError ? "bg-rose-500/10 border-rose-500/20 text-rose-400" : "bg-emerald-500/10 border-emerald-500/20 text-emerald-400" %> border rounded-2xl flex items-center gap-4">
    <div class="w-10 h-10 <%= isError ? "bg-rose-500" : "bg-emerald-500" %> text-white rounded-full flex items-center justify-center shadow-lg shadow-black/20">
      <i class="fas <%= isError ? "fa-exclamation-triangle" : "fa-check-double" %>"></i>
    </div>
    <div class="text-[10px] font-black uppercase tracking-widest"><%= msg %></div>
  </div>
  <% } %>

  <div class="relative z-10">
    <form action="UpdateCredentialsServlet" method="POST" enctype="multipart/form-data" class="text-center">

      <div class="relative inline-block mb-8">
        <div id="profilePreview" class="w-32 h-32 bg-slate-800 rounded-[40px] flex items-center justify-center text-white text-5xl shadow-2xl overflow-hidden border-4 border-white/5 transition-all group-hover:border-blue-500/50">
          <i class="fas fa-user-shield text-slate-600"></i>
        </div>

        <label for="profilePic" class="absolute bottom-1 -right-2 w-10 h-10 bg-blue-600 rounded-2xl border-4 border-[#0f172a] flex items-center justify-center text-white text-xs cursor-pointer hover:bg-blue-500 transition-all shadow-xl">
          <i class="fas fa-pencil"></i>
          <input type="file" id="profilePic" name="profilePic" class="hidden" accept="image/*" onchange="previewImage(this)">
        </label>

        <button type="button" onclick="removePhoto()" class="absolute top-1 -right-2 w-10 h-10 bg-slate-800/80 backdrop-blur-md rounded-2xl border-4 border-[#0f172a] flex items-center justify-center text-rose-500 text-xs hover:bg-rose-500 hover:text-white transition-all">
          <i class="fas fa-times"></i>
        </button>
      </div>

      <h2 class="text-2xl font-black text-white tracking-tight">
        <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Staff Admin" %>
      </h2>
      <div class="inline-block px-4 py-1 bg-blue-500/10 rounded-full mt-2">
        <p class="text-blue-400 text-[9px] font-black uppercase tracking-[3px]">Security Settings</p>
      </div>

      <div class="mt-10 space-y-6 text-left">
        <div class="space-y-2">
          <label class="block text-[9px] font-black uppercase tracking-[2px] text-slate-500 ml-1">Identity Verification</label>
          <div class="relative">
            <i class="fas fa-key absolute left-4 top-1/2 -translate-y-1/2 text-slate-600 text-xs"></i>
            <input type="password" name="currentPassword" placeholder="Current Password" required
                   class="input-dark w-full pl-12 pr-4 py-4 rounded-2xl text-sm font-medium">
          </div>
        </div>

        <div class="space-y-2">
          <label class="block text-[9px] font-black uppercase tracking-[2px] text-slate-500 ml-1">New Access Key</label>
          <div class="relative">
            <i class="fas fa-lock-open absolute left-4 top-1/2 -translate-y-1/2 text-slate-600 text-xs"></i>
            <input type="password" id="newPassword" name="newPassword" placeholder="New Password" required
                   class="input-dark w-full pl-12 pr-4 py-4 rounded-2xl text-sm font-medium">
          </div>
          <div class="flex gap-1 mt-2 px-1">
            <div id="bar1" class="h-1 flex-1 bg-slate-800 rounded-full transition-all"></div>
            <div id="bar2" class="h-1 flex-1 bg-slate-800 rounded-full transition-all"></div>
            <div id="bar3" class="h-1 flex-1 bg-slate-800 rounded-full transition-all"></div>
          </div>
        </div>

        <div class="space-y-2">
          <label class="block text-[9px] font-black uppercase tracking-[2px] text-blue-500/80 ml-1">Re-type New Key</label>
          <div class="relative">
            <i class="fas fa-shield-check absolute left-4 top-1/2 -translate-y-1/2 text-slate-600 text-xs"></i>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required
                   class="input-dark w-full pl-12 pr-4 py-4 rounded-2xl text-sm font-medium">
          </div>
          <p id="matchError" class="hidden text-[9px] text-rose-500 font-bold mt-2 ml-1 uppercase tracking-widest italic">Keys do not match!</p>
        </div>
      </div>

      <div class="pt-10 space-y-5">
        <button type="submit" id="updateBtn" class="w-full py-5 bg-blue-600 text-white rounded-3xl font-black uppercase tracking-widest hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-xl shadow-blue-900/20 text-[10px]">
          Update Security Portal
        </button>

        <a href="dashboard.jsp" class="block text-slate-500 font-bold text-[9px] uppercase tracking-widest hover:text-white transition-all">
          <i class="fas fa-arrow-left-long mr-2"></i> Return to Station
        </a>
      </div>
    </form>
  </div>
</div>

<script>
  // Image Preview
  function previewImage(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('profilePreview').innerHTML = '<img src="' + e.target.result + '" class="w-full h-full object-cover">';
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  function removePhoto() {
    if(confirm("Discard profile image?")) {
      document.getElementById('profilePreview').innerHTML = '<i class="fas fa-user-shield text-slate-600 text-5xl"></i>';
      document.getElementById('profilePic').value = "";
    }
  }

  // Password Validation & Strength
  const newPass = document.getElementById('newPassword');
  const confPass = document.getElementById('confirmPassword');
  const errorMsg = document.getElementById('matchError');
  const btn = document.getElementById('updateBtn');

  newPass.onkeyup = function() {
    let val = newPass.value;
    let b1 = document.getElementById('bar1'), b2 = document.getElementById('bar2'), b3 = document.getElementById('bar3');

    // Simple strength logic
    if(val.length > 0) b1.className = "h-1 flex-1 bg-rose-500 rounded-full";
    else b1.className = "h-1 flex-1 bg-slate-800 rounded-full";

    if(val.length > 5) b2.className = "h-1 flex-1 bg-amber-500 rounded-full";
    else b2.className = "h-1 flex-1 bg-slate-800 rounded-full";

    if(val.length > 8) b3.className = "h-1 flex-1 bg-emerald-500 rounded-full";
    else b3.className = "h-1 flex-1 bg-slate-800 rounded-full";
  }

  confPass.onkeyup = function() {
    if (newPass.value !== confPass.value && confPass.value !== "") {
      errorMsg.classList.remove('hidden');
      btn.disabled = true;
      btn.classList.add('opacity-30');
    } else {
      errorMsg.classList.add('hidden');
      btn.disabled = false;
      btn.classList.remove('opacity-30');
    }
  }

  // Auto-hide status message after 5 seconds
  setTimeout(() => {
    const msg = document.getElementById('statusMessage');
    if(msg) {
      msg.style.transition = "0.5s opacity";
      msg.style.opacity = "0";
      setTimeout(() => msg.remove(), 500);
    }
  }, 5000);
</script>

</body>
</html>