package com.icbt.servlet;

import com.icbt.model.User;
import com.icbt.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        userService = new UserService();
    }

    // Handle GET: If already logged in, redirect to main menu
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect("main-menu.jsp"); // already logged in
            return;
        }

        // If not logged in, forward to login.jsp
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    // Handle POST: Process login
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.login(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
//            req.sendRedirect("main-menu.jsp");
            req.getRequestDispatcher("main-menu.jsp").forward(req,resp);

        } else {
            resp.sendRedirect("login.jsp?error=true");
        }
    }
}
