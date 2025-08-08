<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.icbt.model.User" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Pahana Edu - Main Menu</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #e0ecf8, #f9f9f9);
      padding: 50px;
      margin: 0;
    }

    .menu {
      max-width: 600px;
      margin: auto;
      background-color: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }

    h2 {
      text-align: center;
      color: #1a1a1a;
      margin-bottom: 35px;
      font-size: 24px;
    }

    .grid-buttons {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 15px;
      margin-bottom: 30px;
    }

    .menu a {
      display: block;
      padding: 14px;
      text-decoration: none;
      color: white;
      font-weight: bold;
      border-radius: 8px;
      text-align: center;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .menu a:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    /* All 6 main buttons get the same color */
    .grid-buttons a {
      background-color: #3498db;
    }

    /* Logout button is styled separately */
    .logout-button {
      background-color: #e74c3c;
      margin-top: 10px;
    }
  </style>
</head>
<body>

<div class="menu">
  <h2>Welcome, <%= user.getUsername() %></h2>

  <div class="grid-buttons">
    <a href="add-new-customer.jsp">Add New Customer</a>
    <a href="CustomerServlet">Edit Customer</a>
    <a href="ItemServlet">Manage Items</a>
    <a href="DisplayAccount.jsp">Display Account</a>
    <a href="BillServlet">Print Bill</a>
    <a href="help.jsp">Help</a>
  </div>

  <a class="logout-button" href="LogoutServlet" onclick="return confirm('Are you sure you want to logout?')">Logout</a>
</div>

</body>
</html>
