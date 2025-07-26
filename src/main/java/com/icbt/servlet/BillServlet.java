package com.icbt.servlet;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.service.BillItemService;
import com.icbt.service.BillService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
    private final BillService billService = new BillService();
    private final BillItemService billItemService = new BillItemService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to billing.jsp
        response.sendRedirect("billing.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        try {
            int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
            String[] itemIds = request.getParameterValues("itemId");
            String[] quantities = request.getParameterValues("quantity");
            String[] prices = request.getParameterValues("price");

            // Validate input arrays
            if (itemIds == null || quantities == null || prices == null
                    || itemIds.length != quantities.length || itemIds.length != prices.length) {
                response.sendRedirect("error.jsp");
                return;
            }

            List<BillItem> billItems = new ArrayList<>();
            double totalAmount = 0;

            // Create BillItem objects and calculate total amount
            for (int i = 0; i < itemIds.length; i++) {
                BillItem item = new BillItem();
                item.setItemId(Integer.parseInt(itemIds[i]));
                item.setQuantity(Integer.parseInt(quantities[i]));
                item.setPrice(Double.parseDouble(prices[i]));

                totalAmount += item.getQuantity() * item.getPrice();
                billItems.add(item);
            }

            // Create Bill object with current date
            Bill bill = new Bill();
            bill.setAccountNumber(accountNumber);
            bill.setTotalAmount(totalAmount);
            bill.setBillDate(new Date());

            // Add bill to database and get generated billId
            int billId = billService.addBill(bill);

            if (billId > 0) {
                // Set billId for each BillItem before saving
                for (BillItem item : billItems) {
                    item.setBillId(billId);
                }
                billItemService.saveBillItems(billItems);

                // Redirect to success page after successful insertion
                response.sendRedirect("billing-success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
