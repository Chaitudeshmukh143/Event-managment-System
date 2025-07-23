package com.pack.event_managment_system;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/CreateEventServlet")
public class CreateEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String eventDate = req.getParameter("eventDate");
        String location = req.getParameter("location");
        double price = Double.parseDouble(req.getParameter("price"));
        int tickets = Integer.parseInt(req.getParameter("tickets"));

        try (Connection con = DBConnect.getCon()) {
            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO events (user_id, title, description, event_date, location, ticket_price, total_tickets, tickets_available) VALUES (?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?)"
            );
            pst.setInt(1, userId);
            pst.setString(2, title);
            pst.setString(3, description);
            pst.setString(4, eventDate);
            pst.setString(5, location);
            pst.setDouble(6, price);
            pst.setInt(7, tickets);
            pst.setInt(8, tickets);

            int result = pst.executeUpdate();
            if (result > 0) {
                res.sendRedirect("dashboard.jsp?msg=event_created");
            } else {
                res.sendRedirect("create_event.jsp?msg=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("create_event.jsp?msg=exception");
        }
    }
}

