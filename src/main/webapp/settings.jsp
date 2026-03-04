<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Staff Settings | Ocean View Resort</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    body { font-family: 'Plus Jakarta Sans', sans-serif; }
    .glass-card { background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(20px); border: 1px solid rgba(255, 255, 255, 0.4); }
    .success-animation { animation: slideDown 0.4s ease-out; }
    @keyframes slideDown { from { transform: translateY(-10px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }
  </style>
</head>
<body class="bg-[#f1f5f9] min-h-screen flex items-center justify-center p-6">

<div class="max-w-md w-full glass-card rounded-[50px] shadow-2xl p-10 relative overflow-hidden">

  <% if(request.getAttribute("message") != null) {
    String msg = (String)request.getAttribute("message");
    boolean isError = msg.toLowerCase().contains("failed") || msg.toLowerCase().contains("not match");
  %>
  <div class="success-animation mb-6 p-4 <%= isError ? "bg-rose-50 border-rose-100 text-rose-700" : "bg-emerald-50 border-emerald-100 text-emerald-700" %> border rounded-2xl flex items-center gap-4">
    <div class="w-10 h-10 <%= isError ? "bg-rose-500" : "bg-emerald-500" %> text-white rounded-full flex items-center justify-center shadow-md">
      <i class="fas <%= isError ? "fa-exclamation" : "fa-check" %>"></i>
    </div>
    <div class="text-[10px] font-black uppercase tracking-widest"><%= msg %></div>
  </div>
  <% } %>

  <div class="relative z-10">
    <div class="text-center mb-10">
      <form action="UpdateCredentialsServlet" method="POST" enctype="multipart/form-data">

        <div class="relative inline-block group">
          <div id="profilePreview" class="w-32 h-32 bg-slate-900 rounded-[45px] flex items-center justify-center text-white text-5xl shadow-2xl mb-4 mx-auto overflow-hidden border-4 border-white transition-all">
            <i class="fas fa-user-shield"></i>
          </div>

          <label for="profilePic" class="absolute bottom-2 -right-2 w-10 h-10 bg-blue-600 rounded-2xl border-4 border-white flex items-center justify-center text-white text-xs cursor-pointer hover:bg-blue-700 transition-all shadow-lg" title="Upload Photo">
            <i class="fas fa-camera"></i>
            <input type="file" id="profilePic" name="profilePic" class="hidden" accept="image/*" onchange="previewImage(this)">
          </label>

          <button type="button" onclick="removePhoto()" class="absolute top-2 -right-2 w-10 h-10 bg-rose-500 rounded-2xl border-4 border-white flex items-center justify-center text-white text-xs hover:bg-rose-600 transition-all shadow-lg" title="Remove Photo">
            <i class="fas fa-trash-can"></i>
          </button>
        </div>

        <h2 class="text-2xl font-black text-slate-900 tracking-tight mt-4">
          <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Staff Member" %>
        </h2>
        <p class="text-blue-600 text-[10px] font-black uppercase tracking-[3px] mt-1">Authorized Staff</p>

        <div class="mt-10 space-y-5 text-left">

          <div>
            <label class="block text-[10px] font-black uppercase tracking-[2px] text-slate-400 mb-2 ml-1">Current Password</label>
            <input type="password" name="currentPassword" required class="w-full p-4 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500 outline-none transition-all font-medium">
          </div>

          <div>
            <label class="block text-[10px] font-black uppercase tracking-[2px] text-slate-400 mb-2 ml-1">New Password</label>
            <input type="password" id="newPassword" name="newPassword" required class="w-full p-4 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500 outline-none transition-all font-medium">
          </div>

          <div>
            <label class="block text-[10px] font-black uppercase tracking-[2px] text-blue-600 mb-2 ml-1">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required class="w-full p-4 bg-white border border-blue-100 rounded-2xl focus:ring-4 focus:ring-blue-500/10 focus:border-blue-500 outline-none transition-all font-medium">
            <p id="matchError" class="hidden text-[10px] text-rose-500 font-bold mt-2 ml-1 uppercase tracking-widest italic">Passwords do not match!</p>
          </div>
        </div>

        <div class="pt-10 space-y-4">
          <button type="submit" id="updateBtn" class="w-full py-5 bg-slate-900 text-white rounded-[24px] font-black uppercase tracking-widest hover:bg-blue-600 transition-all shadow-2xl shadow-slate-300 text-[11px]">
            Update Credentials
          </button>

          <a href="dashboard.jsp" class="block text-center py-2 text-slate-400 font-bold text-[10px] uppercase tracking-widest hover:text-slate-900 transition-all">
            <i class="fas fa-arrow-left mr-2"></i> Return to Dashboard
          </a>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
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
    if(confirm("Are you sure you want to remove your profile photo?")) {
      document.getElementById('profilePreview').innerHTML = '<i class="fas fa-user-shield text-5xl"></i>';
      document.getElementById('profilePic').value = "";
    }
  }

  const newPass = document.getElementById('newPassword');
  const confPass = document.getElementById('confirmPassword');
  const errorMsg = document.getElementById('matchError');
  const btn = document.getElementById('updateBtn');

  confPass.onkeyup = function() {
    if (newPass.value !== confPass.value && confPass.value !== "") {
      errorMsg.classList.remove('hidden');
      btn.disabled = true;
      btn.classList.add('opacity-50');
    } else {
      errorMsg.classList.add('hidden');
      btn.disabled = false;
      btn.classList.remove('opacity-50');
    }
  }
</script>

</body>
</html>