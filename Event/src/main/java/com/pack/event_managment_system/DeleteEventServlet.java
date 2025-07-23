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
@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            res.sendRedirect("login.jsp");
            return;
        }

        int eventId = Integer.parseInt(req.getParameter("eventId"));

        try (Connection con = DBConnect.getCon()) {
            PreparedStatement pst = con.prepareStatement("DELETE FROM events WHERE event_id = ?");
            pst.setInt(1, eventId);
            pst.executeUpdate();

            res.sendRedirect("admin_dashboard.jsp?msg=deleted");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("admin_dashboard.jsp?msg=exception");
        }
    }
}
