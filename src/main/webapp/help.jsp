<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Help & User Guide</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f4f7f9;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 900px;
      margin: 40px auto;
      padding: 30px;
      background: #ffffff;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }

    h1, h2 {
      text-align: center;
      color: #2c3e50;
    }

    h2 {
      margin-top: 40px;
      border-bottom: 2px solid #ecf0f1;
      padding-bottom: 5px;
    }

    p {
      line-height: 1.6;
      color: #34495e;
    }

    ul {
      margin-left: 20px;
      color: #2c3e50;
    }

    .highlight {
      background: #e3f2fd;
      padding: 15px;
      border-left: 5px solid #2196f3;
      margin: 20px 0;
      border-radius: 5px;
    }

    .footer {
      text-align: center;
      font-size: 14px;
      color: #888;
      margin-top: 50px;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>📘 Bookshop Management System - User Help Guide</h1>
  <p>Welcome to the Bookshop Management System! This guide will help you get started and understand the features available in the system.</p>

  <h2>🔐 Logging In</h2>
  <p>To use the system, log in with your credentials provided by the administrator.</p>
  <ul>
    <li>Enter your username and password on the login page.</li>
    <li>If successful, you will be redirected to the main dashboard.</li>
  </ul>

  <h2>🏠 Main Dashboard</h2>
  <p>The dashboard allows you to access different features:</p>
  <ul>
    <li>View and manage customers</li>
    <li>View, add, and edit items</li>
    <li>Create, update, and view bills</li>
    <li>Access this help page anytime</li>
  </ul>

  <h2>👥 Customer Management</h2>
  <p>Navigate to the <strong>Customers</strong> section to:</p>
  <ul>
    <li>Add a new customer using the "Add Customer" form</li>
    <li>Edit existing customer details</li>
    <li>View a list of all registered customers</li>
  </ul>

  <h2>📚 Item Management</h2>
  <p>In the <strong>Items</strong> section, you can:</p>
  <ul>
    <li>Add new books to your stock</li>
    <li>Edit item information such as price or quantity</li>
    <li>View all available books and current stock levels</li>
  </ul>

  <h2>🧾 Billing</h2>
  <p>Use the <strong>Billing</strong> section to:</p>
  <ul>
    <li>Create a new bill by selecting a customer and items</li>
    <li>Edit or update existing bills</li>
    <liAutomatically calculate totals and view all bills</li>
  </ul>

  <div class="highlight">
    💡 <strong>Tip:</strong> Always double-check item quantities and customer selection before saving a bill.
  </div>

  <h2>❓ Need More Help?</h2>
  <p>If you encounter any issues or need additional support, please contact the system administrator or refer to the technical documentation provided.</p>

  <div class="footer">
    &copy; 2025 Pahana Edu Bookshop System | Help Page
  </div>
</div>

</body>
</html>
