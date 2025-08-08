<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.model.Customer" %>
<%@ page import="com.icbt.dao.CustomerDAO" %>
<%
    String accountNumberStr = request.getParameter("accountNumber");
    Customer customer = null;
    if (accountNumberStr != null && !accountNumberStr.trim().isEmpty()) {
        try {
            int accountNumber = Integer.parseInt(accountNumberStr);
            CustomerDAO dao = new CustomerDAO();
            customer = dao.getCustomerById(accountNumber);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid account number format.");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Display Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            max-width: 450px;
            margin: 0 auto 30px;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            margin-bottom: 6px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            margin-bottom: 20px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .result {
            max-width: 600px;
            margin: 0 auto;
            padding: 25px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .result h3 {
            margin-top: 0;
            color: #333;
            margin-bottom: 20px;
        }

        .result p {
            margin: 10px 0;
            font-size: 15px;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
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

<h2>Search Customer by Account Number</h2>

<form method="get" action="display-account.jsp">
    <label for="accountNumber">Account Number:</label>
    <input type="text" name="accountNumber" id="accountNumber" required>
    <input type="submit" value="Search">
</form>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p class="error"><%= error %></p>
<%
    }
    if (customer != null) {
%>
<div class="result">
    <h3>Customer Details</h3>
    <p><strong>Account Number:</strong> <%= customer.getAccountNumber() %></p>
    <p><strong>Name:</strong> <%= customer.getName() %></p>
    <p><strong>Address:</strong> <%= customer.getAddress() %></p>
    <p><strong>Telephone:</strong> <%= customer.getTelephone() %></p>
</div>
<%
} else if (accountNumberStr != null) {
%>
<p class="error">No customer found with the given account number.</p>
<%
    }
%>

<div class="back-home">
    <a href="main-menu.jsp">← Back to Home</a>
</div>

</body>
</html>
