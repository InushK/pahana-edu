<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.Item, com.icbt.model.Customer" %>
<%
  List<Item> items = (List<Item>) request.getAttribute("items");
  List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Create Bill</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      padding: 30px;
    }

    h2 {
      text-align: center;
    }

    .form-container {
      background: #fff;
      padding: 25px;
      max-width: 800px;
      margin: auto;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0,0,0,0.2);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 15px;
    }

    table, th, td {
      border: 1px solid #ccc;
    }

    th, td {
      padding: 10px;
      text-align: left;
    }

    .add-btn, .submit-btn {
      padding: 10px 20px;
      margin-top: 10px;
      border: none;
      border-radius: 5px;
      background-color: #3498db;
      color: white;
      cursor: pointer;
    }

    .remove-btn {
      padding: 5px 10px;
      background-color: #e74c3c;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    select, input {
      width: 100%;
      padding: 6px;
      box-sizing: border-box;
    }
  </style>
</head>
<body>
<h2>Create Bill</h2>
<div class="form-container">
  <form action="BillServlet" method="post" onsubmit="return prepareFormBeforeSubmit()">
    <label for="customer_id">Select Customer:</label>
    <select name="customer_id" id="customer_id" required>
      <option value="">-- Select Customer --</option>
      <% for (Customer customer : customers) { %>
      <option value="<%= customer.getAccountNumber() %>"><%= customer.getName() %></option>
      <% } %>
    </select>

    <h3>Items</h3>
    <table id="itemTable">
      <thead>
      <tr>
        <th>Item</th>
        <th>Quantity</th>
        <th>Unit Price</th>
        <th>Action</th>
      </tr>
      
      </thead>
      <tbody>
      <tr>
        <td>
          <select name="itemId" onchange="setPrice(this)" required>
            <% for (Item item : items) { %>
            <option value="<%= item.getItem_id() %>" data-price="<%= item.getUnit_price() %>">
              <%= item.getItem_name() %>
            </option>
            <% } %>
          </select>
        </td>
        <td><input type="number" name="quantity" min="1" required></td>
        <td><input type="number" step="0.01" name="price" min="0" required></td>
        <td><button type="button" class="remove-btn" onclick="removeRow(this)">Remove</button></td>
      </tr>
      </tbody>
    </table>

    <button type="button" class="add-btn" onclick="addRow()">Add Another Item</button><br>
    <button type="submit" class="submit-btn">Submit Bill</button>
  </form>
</div>

<script>
    function addRow() {
    const template = document.getElementById("item-row-template");
    const clone = template.content.cloneNode(true);
    const tableBody = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
    tableBody.appendChild(clone);
  }

    function removeRow(button) {
    button.closest("tr").remove();
  }

    function setPrice(selectElement) {
    const selectedOption = selectElement.options[selectElement.selectedIndex];
    const price = selectedOption.getAttribute("data-price");
    if (price) {
    const row = selectElement.closest("tr");
    row.querySelector('input[name="price"]').value = price;
  }
  }



function prepareFormBeforeSubmit() {
    const itemIds = document.getElementsByName("itemId");
    const quantities = document.getElementsByName("quantity");
    const prices = document.getElementsByName("price");

    for (let i = 0; i < itemIds.length; i++) {
      itemIds[i].name = "itemId[]";
      quantities[i].name = "quantity[]";
      prices[i].name = "price[]";
    }
    return true;
  }
</script>

<!-- Template to clone item row -->
<template id="item-row-template">
  <tr>
    <td>
      <select name="itemId" onchange="setPrice(this)" required>
        <option value="">Select Item</option>
        <%
          List<Item> items2 = (List<Item>) request.getAttribute("items");
          if (items2 != null) {
            for (Item item : items2) {
        %>
        <option value="<%= item.getItem_id() %>" data-price="<%= item.getUnit_price() %>">
          <%= item.getItem_name() %>
        </option>
        <%
            }
          }
        %>
      </select>
    </td>
    <td><input type="number" name="quantity" min="1" required></td>
    <td><input type="number" name="price" step="0.01" min="0" required></td>
    <td><button type="button" class="remove-btn" onclick="removeRow(this)">Remove</button></td>
  </tr>
</template>

</body>
</html>
