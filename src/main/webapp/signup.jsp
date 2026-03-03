<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Signup - Ocean View Resort</title>
    <!-- Using Tailwind CSS for a premium resort look -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-blue-50 font-sans antialiased min-h-screen flex items-center justify-center relative overflow-hidden">

<!-- Background Decor -->
<div class="absolute top-0 left-0 w-full h-96 bg-gradient-to-br from-blue-600 to-teal-500 rounded-b-[100px] z-0 shadow-lg"></div>

<div class="relative z-10 w-full max-w-lg bg-white rounded-xl shadow-2xl p-8 m-4">
    <div class="text-center mb-8">
        <i class="fas fa-umbrella-beach text-4xl text-teal-500 mb-3"></i>
        <h1 class="text-2xl font-bold text-gray-800">Ocean View Resort</h1>
        <p class="text-gray-500 text-sm mt-1">Staff Portal Registration</p>
    </div>

    <!-- Error Handling Display -->
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="bg-red-50 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded shadow-sm flex items-center" role="alert">
        <i class="fas fa-exclamation-circle mr-3 text-lg"></i>
        <p><%= request.getAttribute("errorMessage") %></p>
    </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/signup" method="POST" class="space-y-5">
        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400"><i class="fas fa-user"></i></span>
                <input type="text" name="fullName" value="<%= request.getAttribute("fullName") != null ? request.getAttribute("fullName") : "" %>" required
                       class="pl-10 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition-all">
            </div>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400"><i class="fas fa-envelope"></i></span>
                <input type="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required
                       class="pl-10 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition-all">
            </div>
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Department</label>
            <div class="relative">
                <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400"><i class="fas fa-briefcase"></i></span>
                <select name="department" required class="pl-10 w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition-all appearance-none bg-white">
                    <option value="" disabled selected>Select Department</option>
                    <option value="Front Desk">Front Desk</option>
                    <option value="Housekeeping">Housekeeping</option>
                    <option value="Food & Beverage">Food & Beverage</option>
                    <option value="Management">Management</option>
                </select>
            </div>
        </div>

        <div class="grid grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition-all">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Confirm Password</label>
                <input type="password" name="confirmPassword" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-teal-500 focus:border-teal-500 outline-none transition-all">
            </div>
        </div>

        <button type="submit" class="w-full bg-teal-600 hover:bg-teal-700 text-white font-semibold py-3 px-4 rounded-lg transition duration-200 shadow-md">
            Register Staff Account
        </button>
    </form>

    <p class="mt-6 text-center text-sm text-gray-600">
        Already registered? <a href="<%= request.getContextPath() %>/login" class="text-teal-600 hover:text-teal-800 font-semibold">Sign in here</a>
    </p>
</div>
</body>
</html>