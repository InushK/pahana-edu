<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.icbt.model.Bill, com.icbt.model.BillItem, java.util.List" %>
<%
    Bill bill = (Bill) request.getAttribute("bill"); // fetched from servlet
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Bill</title>
    <!-- You can reuse the same CSS and scripts as create-bill.jsp -->
    <style> /* same styling as create-bill.jsp */ </style>
    <script>
        function addRow() {
            let table = document.getElementById("itemTable");
            let row = table.insertRow(-1);
            row.innerHTML = `
                <td><input type="number" name="itemId" required></td>
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
<h2>Update Bill</h2>
<div class="form-container">
    <form action="BillUpdateServlet" method="post" onsubmit="return prepareFormBeforeSubmit()">
        <input type="hidden" name="billId" value="<%= bill.getId() %>"/>
        <label for="accountNumber"><strong>Customer Account Number:</strong></label><br>
        <input type="number" id="accountNumber" name="accountNumber" value="<%= bill.getAccountNumber() %>" required><br><br>

        <table id="itemTable">
            <thead>
            <tr>
                <th>Item ID</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (BillItem item : billItems) { %>
            <tr>
                <td><input type="number" name="itemId" value="<%= item.getItemId() %>" required></td>
                <td><input type="number" name="quantity" min="1" value="<%= item.getQuantity() %>" required></td>
                <td><input type="number" step="0.01" name="price" min="0" value="<%= item.getPrice() %>" required></td>
                <td><button type="button" onclick="removeRow(this)">Remove</button></td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <button type="button" class="btn" onclick="addRow()">Add Another Item</button><br>
        <button type="submit" class="btn">Update Bill</button>
    </form>
</div>
</body>
</html>
