<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.icbt.model.Bill, com.icbt.model.BillItem, com.icbt.model.Customer" %>
<%@ page import="com.icbt.model.Item" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
    Customer customer = (Customer) request.getAttribute("customer");
    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Summary</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f8f8f8; padding: 30px; }
        .bill-container { background: white; padding: 20px; max-width: 800px; margin: auto; border-radius: 8px; }
        h2, h3 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ccc; padding: 8px; }
        .print-btn { background: #3498db; color: white; padding: 10px 15px; border: none; cursor: pointer; margin-top: 15px; }
    </style>
</head>
<body>

<div class="bill-container" id="billArea">
    <h2>Bookshop Management System - Bill Statement</h2>
    <h3>Bill #<%= bill.getBillId() %></h3>
    <p><strong>Date:</strong> <%= bill.getBillDate() %></p>
    <p><strong>Customer:</strong> <%= customer.getName() %></p>

    <table>
        <thead>
        <tr>
            <th>Item</th>
            <th>Quantity</th>
            <th>Unit Price (Rs.)</th>
            <th>Total (Rs.)</th>
        </tr>
        </thead>
        <tbody>
        <%
            double grandTotal = 0;
            for (BillItem item : billItems) {
                double total = item.getQuantity() * item.getPrice();
                grandTotal += total;
        %>
        <tr>
            <% for (Item i : items) {
                if (i.getItem_id() == item.getItemId()) { %>
                    <td><%= i.getItem_name() %></td>
            <% } } %>
<%--            <td><%= item.getItemId() %></td>--%>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= total %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <h3>Total: Rs. <%= grandTotal %></h3>
</div>

<div style="text-align:center;">
    <button class="print-btn" onclick="printBill()">Print / Save as PDF</button>
</div>

<script>
    function printBill() {
        const billContent = document.getElementById("billArea").innerHTML;
        const win = window.open('', '', 'height=700,width=900');
        win.document.write('<html><head><title>Bill</title>');
        win.document.write('</head><body>');
        win.document.write(billContent);
        win.document.write('</body></html>');
        win.document.close();
        win.print();
    }
</script>

</body>
</html>
