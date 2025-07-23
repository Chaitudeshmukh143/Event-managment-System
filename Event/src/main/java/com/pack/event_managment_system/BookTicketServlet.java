package com.pack.event_managment_system;




import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/BookTicketServlet")
public class BookTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        int eventId = Integer.parseInt(req.getParameter("eventId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try (Connection con = DBConnect.getCon()) {
            // Check ticket availability
            PreparedStatement check = con.prepareStatement("SELECT tickets_available FROM events WHERE event_id = ?");
            check.setInt(1, eventId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                int available = rs.getInt("tickets_available");
                if (available < quantity) {
                    res.sendRedirect("book_ticket.jsp?eventId=" + eventId + "&msg=not_enough");
                    return;
                }

                // Book ticket
                PreparedStatement book = con.prepareStatement(
                    "INSERT INTO tickets (event_id, user_id, quantity) VALUES (?, ?, ?)"
                );
                book.setInt(1, eventId);
                book.setInt(2, userId);
                book.setInt(3, quantity);
                book.executeUpdate();

                // Update event ticket count
                PreparedStatement update = con.prepareStatement(
                    "UPDATE events SET tickets_available = tickets_available - ? WHERE event_id = ?"
                );
                update.setInt(1, quantity);
                update.setInt(2, eventId);
                update.executeUpdate();

                res.sendRedirect("events.jsp?msg=success");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("book_ticket.jsp?eventId=" + req.getParameter("eventId") + "&msg=error");
        }
    }
}
