<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.*" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
    List<Item> items = (List<Item>) request.getAttribute("items");
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bill</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f9f9f9;
            padding: 30px;
        }

        h2 {
            text-align: center;
        }

        form {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            max-width: 850px;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        select, input[type="number"], input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .btn-secondary {
            background-color: #666;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<h2>Edit Bill - ID: <%= bill.getBillId() %></h2>

<form action="BillServlet" method="post">
    <input type="hidden" name="formAction" value="update" />
    <input type="hidden" name="billId" value="<%= bill.getBillId() %>" />

    <label for="customer_id">Account Number:</label>
    <select name="customer_id" required>
        <% for (Customer customer : customers) { %>
        <option value="<%= customer.getAccountNumber() %>"
                <%= customer.getAccountNumber() == bill.getAccountNumber() ? "selected" : "" %>>
            <%= customer.getAccountNumber() %> - <%= customer.getName() %>
        </option>
        <% } %>
    </select>

    <table>
        <thead>
        <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        <% for (BillItem billItem : billItems) { %>
        <tr>
            <td>
                <select name="itemId[]">
                    <% for (Item item : items) { %>
                    <option value="<%= item.getItem_id() %>" <%= item.getItem_id() == billItem.getItemId() ? "selected" : "" %>>
                        <%= item.getItem_name() %>
                    </option>
                    <% } %>
                </select>
            </td>
            <td>
                <input type="number" name="quantity[]" value="<%= billItem.getQuantity() %>" min="1" required />
            </td>
            <td>
                <input type="text" name="price[]" value="<%= billItem.getPrice() %>" required />
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div style="text-align: center;">
        <button type="submit" class="btn">Update Bill</button>
        <a href="BillServlet" class="btn btn-secondary">Cancel</a>
    </div>
</form>

</body>
</html>
