package com.icbt.servlet;

import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumberStr = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");

        Customer customer = new Customer();
        customer.setName(name);
        customer.setAddress(address);
        customer.setTelephone(telephone);

        boolean success;

        if (accountNumberStr == null || accountNumberStr.isEmpty()) {
            // ADD mode
            success = customerService.registerCustomer(customer);
        } else {
            // EDIT mode
            try {
                int accountNumber = Integer.parseInt(accountNumberStr);
                customer.setAccountNumber(accountNumber);
                success = customerService.updateCustomer(customer);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                success = false;
            }
        }

        if (success) {
            // ✅ Redirect to customer list (doGet will handle loading and forwarding)
            response.sendRedirect("CustomerServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Customer> customerList = customerService.getAllCustomers();
        request.setAttribute("customers", customerList);
        request.getRequestDispatcher("show-customer.jsp").forward(request, response);
    }
}
