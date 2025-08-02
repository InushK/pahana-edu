<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.Item" %>
<%
  List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Items List</title>
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
      text-align: left;
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
  </style>
</head>
<body>

<h2>Item List</h2>

<div style="text-align: center;">
  <a class="btn" href="add-item.jsp">+ Add New Item</a>
</div>

<table>
  <tr>
    <th>Item Code</th>
    <th>Name</th>
    <th>Description</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Actions</th>
  </tr>

  <% if (items != null) {
    for (Item item : items) {
  %>
  <tr>
    <td><%= item.getItem_id() %></td>
    <td><%= item.getItem_name() %></td>
    <td><%= item.getItem_description() %></td>
    <td><%= item.getUnit_price() %></td>
    <td><%= item.getStock_quantity() %></td>
    <td class="actions">
      <a class="btn" href="edit-item.jsp?item_id=<%= item.getItem_id() %>&item_name=<%= item.getItem_name() %>&item_description=<%= item.getItem_description() %>&unit_price=<%= item.getUnit_price() %>&stock_quantity=<%= item.getStock_quantity() %>">Edit</a>

      <a class="btn btn-danger"
         href="ItemServlet?action=delete&id=<%= item.getItem_id() %>"
         onclick="return confirm('Are you sure you want to delete this item?');">
        Delete
      </a>
    </td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="6" style="text-align:center;">No items available.</td>
  </tr>
  <% } %>
</table>

</body>
</html>
