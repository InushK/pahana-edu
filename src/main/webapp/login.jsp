<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #dcecfb, #f0f0f0);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .main-heading {
            font-size: 28px;
            font-weight: bold;
            color: #1a1a1a;
            margin-bottom: 25px;
        }

        .login-container {
            width: 350px;
            padding: 30px 25px;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }


        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #333;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #0000ff;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #3e8e41;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .success {
            color: blue;
            text-align: center;
            margin-bottom: 15px;
        }
        .help-link {
            margin-top: 10px;
            display: inline-block;
            color: #0000cc;
            font-size: 14px;
            text-decoration: none;
        }

        .help-link:hover {
            text-decoration: underline;
        }

        .footer {
            margin-top: 30px;
            font-size: 14px;
            color: #666;
            text-align: center;
        }

    </style>
</head>
<body>

<div class="main-heading">Bookshop Management System</div>

<div class="login-container">
    <h2>Login</h2>

    <%-- Display error or success messages --%>
    <%
        String error = request.getParameter("error");
        String message = request.getParameter("message");

        if ("logout".equals(message)) {
    %>
    <p class="success">Logout successful!</p>
    <%
    } else if (error != null) {
    %>
    <p class="error">Invalid username or password.</p>
    <%
        }
    %>

    <form action="login" method="post">
        <label>Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">
    </form>

    <a class="help-link" href="help.jsp">Need Help?</a>
</div>

<div class="footer">
    &copy; 2025 Pahana Edu Bookshop System

</div>

</body>
</html>
