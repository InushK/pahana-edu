<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int billId = Integer.parseInt(request.getParameter("billId"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Bill</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 30px; background-color: #f5f5f5; }
        .confirm-container { background: white; padding: 20px; border-radius: 8px; max-width: 400px; margin: auto; box-shadow: 0 0 10px #ccc; }
        button { padding: 10px 15px; margin: 5px; border: none; border-radius: 5px; cursor: pointer; }
        .btn-delete { background-color: #d32f2f; color: white; }
        .btn-cancel { background-color: #757575; color: white; }
    </style>
</head>
<body>
<div class="confirm-container">
    <h2>Confirm Delete Bill</h2>
    <p>Are you sure you want to delete Bill ID: <strong><%= billId %></strong>?</p>
    <form action="BillDeleteServlet" method="post">
        <input type="hidden" name="billId" value="<%= billId %>"/>
        <button type="submit" class="btn-delete">Delete</button>
        <button type="button" class="btn-cancel" onclick="window.location.href='billing.jsp'">Cancel</button>
    </form>
</div>
</body>
</html>
