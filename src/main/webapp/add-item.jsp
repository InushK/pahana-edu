<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add New Item</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #E3E3E3;
      padding: 40px;
    }

    .form-container {
      width: 450px;
      margin: auto;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      border: 1px solid #ccc;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
      color: #444;
    }

    input[type="text"],
    input[type="number"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #bbb;
      border-radius: 5px;
      margin-bottom: 16px;
      font-size: 14px;
      box-sizing: border-box;
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background-color: #666;
      color: #ffffff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #555;
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #666;
      text-decoration: none;
    }

    .back-link:hover {
      text-decoration: underline;
      color: #444;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Add New Item</h2>
  <form action="ItemServlet" method="post">
    <label for="name">Item Name:</label>
    <input type="text" id="name" name="item_name" required>

    <label for="description">Item Description:</label>
    <input type="text" id="description" name="item_description" required>

    <label for="price">Price (LKR):</label>
    <input type="number" id="price" name="unit_price" step="0.01" required>

    <label for="stock">Stock Quantity:</label>
    <input type="number" id="stock" name="stock_quantity" required>

    <input type="submit" value="Add Item">
  </form>

  <a class="back-link" href="ItemServlet">← Back to Item List</a>
</div>

</body>
</html>
