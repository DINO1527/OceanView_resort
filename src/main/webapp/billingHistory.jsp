<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%-- 1. Inga ungal Model matrum DAO-vai import pannungalk --%>
<%@ page import="com.oceanview.dao.BillingDAO" %>
<%@ page import="com.oceanview.model.Billing" %>

<%
    // 2. Database-il irunthu data-vai fetch pannuvom
    BillingDAO dao = new BillingDAO();
    List<Billing> billList = dao.getAllInvoices(); // Intha method DAO-la irukkanum
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Billing History | Ocean View</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .hero-bg {
            background: linear-gradient(rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.9)),
            url('https://images.unsplash.com/photo-1554224155-6726b3ff858f?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-attachment: fixed;
        }
        .glass-panel {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
        }
    </style>
</head>
<body class="hero-bg min-h-screen p-8">
<div class="max-w-7xl mx-auto">

    <div class="flex flex-col md:flex-row justify-between items-center mb-10 gap-6">
        <div>
            <h1 class="text-3xl text-white uppercase tracking-widest font-bold">Billing History</h1>
            <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[2px] mt-1">Archive of all generated invoices</p>
        </div>

        <div class="flex items-center gap-4">
            <a href="billing.jsp" class="bg-blue-600 hover:bg-blue-500 px-6 py-3 rounded-xl text-white transition-all text-[10px] font-black uppercase tracking-widest shadow-lg shadow-blue-600/20">
                <i class="fas fa-plus mr-2"></i> New Bill
            </a>
            <a href="dashboard.jsp" class="bg-white/5 hover:bg-white/10 px-5 py-3 rounded-xl border border-white/10 text-white transition-all text-[10px] font-black uppercase tracking-widest">
                <i class="fas fa-arrow-left mr-2"></i> Dashboard
            </a>
        </div>
    </div>

    <div class="glass-panel overflow-hidden shadow-2xl">
        <table class="w-full text-left border-collapse">
            <thead>
            <tr class="bg-white/5 border-b border-white/10 text-slate-400 uppercase text-xs font-bold tracking-widest">
                <th class="p-6">Invoice #</th>
                <th class="p-6">Res ID</th>
                <th class="p-6">Guest Name</th>
                <th class="p-6">Date</th>
                <th class="p-6">Total Amount</th>
                <th class="p-6 text-center">Status</th>
                <th class="p-6 text-center">Actions</th>
            </tr>
            </thead>
            <tbody class="text-slate-300">
            <%
                // 3. Dynamic Data Loop
                if(billList != null && !billList.isEmpty()) {
                    for(Billing b : billList) {
            %>
            <tr class="border-b border-white/5 hover:bg-white/5 transition-all">
                <td class="p-6 text-blue-400 font-mono font-bold"><%= b.getInvoiceId() %></td>
                <td class="p-6 text-slate-400 font-mono"><%= b.getResId() %></td>
                <td class="p-6 font-semibold text-white uppercase"><%= b.getGuestName() %></td>
                <td class="p-6 text-sm"><%= b.getBillDate() %></td>
                <td class="p-6 font-bold text-emerald-400">LKR <%= String.format("%,.2f", b.getTotalAmount()) %></td>
                <td class="p-6 text-center">
                    <span class="bg-emerald-500/10 text-emerald-500 px-3 py-1 rounded-full text-[9px] font-black uppercase tracking-widest border border-emerald-500/20">
                        Paid
                    </span>
                </td>
                <td class="p-6 text-center">
                    <div class="flex justify-center gap-5">
                        <a href="generateInvoice.jsp?id=<%= b.getResId() %>" class="text-blue-400 hover:text-white transition-colors" title="Print Bill">
                            <i class="fas fa-print"></i>
                        </a>
                        <a href="editInvoice.jsp?id=<%= b.getInvoiceId() %>" class="text-emerald-400 hover:text-emerald-300 transition-colors" title="Edit Bill">
                            <i class="fas fa-edit"></i>
                        </a>
                        <button onclick="confirmDeleteInvoice('<%= b.getInvoiceId() %>')" class="text-rose-400 hover:text-rose-300 transition-colors" title="Delete Bill">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="7" class="p-10 text-center text-slate-500 italic">No billing records found in database.</td></tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function confirmDeleteInvoice(id) {
        Swal.fire({
            title: 'Delete Invoice?',
            text: "This action cannot be undone for " + id,
            icon: 'warning',
            showCancelButton: true,
            background: '#0f172a',
            color: '#fff',
            confirmButtonColor: '#ef4444',
            cancelButtonColor: '#334155',
            confirmButtonText: 'Yes, Delete'
        }).then((result) => {
            if (result.isConfirmed) {
                // Delete logic
                window.location.href = 'deleteInvoiceServlet?id=' + id;
            }
        })
    }
</script>
</body>
</html>