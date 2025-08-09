<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.Bill" %>
<%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Bills</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #E3E3E3;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .btn {
            display: inline-block;
            padding: 8px 14px;
            background-color: #666;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .btn:hover {
            background-color: #555;
        }

        .btn-danger {
            background-color: #a94442;
        }

        .btn-danger:hover {
            background-color: #843534;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #999;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .actions a {
            margin-right: 8px;
            text-decoration: none;
        }

        .actions form {
            display: inline;
        }

        .top-bar {
            text-align: center;
            margin-bottom: 20px;
        }

        .back-home {
            text-align: center;
            margin-top: 30px;
        }

        .back-home a {
            padding: 10px 16px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-home a:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<h2>Bill List</h2>

<div class="top-bar">
    <a class="btn" href="BillServlet?action=new">+ Create New Bill</a>
</div>

<table>
    <tr>
        <th>Bill ID</th>
        <th>Account Number</th>
        <th>Total Amount</th>
        <th>Bill Date</th>
        <th>Actions</th>
    </tr>

    <% if (bills != null && !bills.isEmpty()) {
        for (Bill bill : bills) {
    %>
    <tr>
        <td><%= bill.getBillId() %></td>
        <td><%= bill.getAccountNumber() %></td>
        <td><%= bill.getTotalAmount() %></td>
        <td><%= bill.getBillDate() %></td>
        <td class="actions">
            <a class="btn"
               href="BillServlet?action=edit&id=<%= bill.getBillId() %>&accountNumber=<%= bill.getAccountNumber() %>&totalAmount=<%= bill.getTotalAmount() %>&billDate=<%= bill.getBillDate() %>">
                Edit
            </a>
            <a class="btn btn-danger"
               href="BillServlet?action=delete&id=<%= bill.getBillId() %>"
               onclick="return confirm('Are you sure you want to delete this bill?');">
                Delete
            </a>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5" style="text-align:center;">No bills available.</td>
    </tr>
    <% } %>
</table>

<div class="back-home">
    <a href="main-menu.jsp">← Back to Home</a>
</div>

</body>
</html>
