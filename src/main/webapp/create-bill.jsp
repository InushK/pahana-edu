<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.icbt.model.Customer, com.icbt.model.Item" %>
<%
  List<Customer> customers = (List<Customer>) request.getAttribute("customers");
  List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Create Bill</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f5f5f5; padding: 30px; }
    h2 { text-align: center; }
    .form-container { background: #fff; padding: 25px; border-radius: 10px; max-width: 800px; margin: auto; box-shadow: 0 0 10px #ccc; }
    table { width: 100%; border-collapse: collapse; margin-top: 15px; }
    table, th, td { border: 1px solid #999; }
    th, td { padding: 8px; text-align: center; }
    input, select { width: 95%; padding: 5px; }
    .btn { padding: 10px 15px; margin-top: 15px; background-color: #2e7d32; color: white; border: none; cursor: pointer; border-radius: 5px; }
    .btn:hover { background-color: #1b5e20; }
  </style>
  <script>
    function addRow() {
      let table = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
      let row = table.insertRow(-1);
      let itemsOptions = `<% for (Item item : items) { %><option value="<%= item.getItem_id() %>"><%= item.getItem_name() %></option><% } %>`;

      row.innerHTML = `
                <td>
                    <select name="itemId">
                        ${itemsOptions}
                    </select>
                </td>
                <td><input type="number" name="quantity" min="1" required></td>
                <td><input type="number" step="0.01" name="price" min="0" required></td>
                <td><button type="button" onclick="removeRow(this)">Remove</button></td>
            `;
    }

    function removeRow(button) {
      let row = button.parentNode.parentNode;
      row.parentNode.removeChild(row);
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
</head>
<body>
<h2>Create New Bill</h2>
<div class="form-container">
  <form action="BillServlet" method="post" onsubmit="return prepareFormBeforeSubmit()">
    <label for="accountNumber"><strong>Customer Account Number:</strong></label><br>
    <select name="accountNumber" id="accountNumber" required>
      <option value="">Select Customer</option>
      <% for (Customer customer : customers) { %>
      <option value="<%= customer.getAccountNumber() %>">
        <%= customer.getAccountNumber() %> - <%= customer.getName() %>
      </option>
      <% } %>
    </select><br><br>

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
          <select name="itemId" required>
            <% for (Item item : items) { %>
            <option value="<%= item.getItem_id() %>">
              <%= item.getItem_name() %>
            </option>
            <% } %>
          </select>
        </td>
        <td><input type="number" name="quantity" min="1" required></td>
        <td><input type="number" step="0.01" name="price" min="0" required></td>
        <td><button type="button" onclick="removeRow(this)">Remove</button></td>
      </tr>
      </tbody>
    </table>

    <button type="button" class="btn" onclick="addRow()">Add Another Item</button><br>
    <button type="submit" class="btn">Generate Bill</button>
  </form>
</div>
</body>
</html>
