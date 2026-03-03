<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Login - Ocean View Resort</title>
    <!-- Using Tailwind CSS for a premium resort look -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-blue-50 font-sans antialiased min-h-screen flex items-center justify-center relative overflow-hidden">

<!-- Background Decor -->
<div class="absolute top-0 left-0 w-full h-96 bg-gradient-to-br from-blue-600 to-teal-500 rounded-b-[100px] z-0 shadow-lg"></div>

<div class="relative z-10 w-full max-w-md bg-white rounded-xl shadow-2xl p-8 m-4">
    <div class="text-center mb-8">
        <i class="fas fa-water text-4xl text-blue-500 mb-3"></i>
        <h1 class="text-2xl font-bold text-gray-800">Welcome Back</h1>
        <p class="text-gray-500 text-sm mt-1">Ocean View Resort Staff Portal</p>
    </div>

    <!-- Success Handling Display (from Signup Redirect) -->
    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="bg-green-50 border-l-4 border-green-500 text-green-700 p-4 mb-6 rounded shadow-sm flex items-center">
        <i class="fas fa-check-circle mr-3 text-lg"></i>
        <p><%= request.getAttribute("successMessage") %></p>
    </div>
    <% } %>

    <!-- Error Handling Display -->
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="bg-red-50 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded shadow-sm flex items-center">
        <i class="fas fa-exclamation-triangle mr-3 text-lg"></i>
        <p><%= request.getAttribute("errorMessage") %></p>
    </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/login" method="POST" class="space-y-6">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400"><i class="fas fa-envelope"></i></span>
                <input type="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required
                       class="pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all">
            </div>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400"><i class="fas fa-lock"></i></span>
                <input type="password" name="password" required
                       class="pl-10 w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all">
            </div>
        </div>

        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-4 rounded-lg transition duration-200 shadow-md">
            Secure Login <i class="fas fa-arrow-right ml-2"></i>
        </button>
    </form>

    <p class="mt-8 text-center text-sm text-gray-600 border-t pt-4">
        New employee? <a href="<%= request.getContextPath() %>/signup" class="text-blue-600 hover:text-blue-800 font-semibold">Request account</a>
    </p>
</div>
</body>
</html>