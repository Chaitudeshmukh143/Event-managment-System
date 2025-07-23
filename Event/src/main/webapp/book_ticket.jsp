<%@ page import="java.sql.*,com.pack.event_managment_system.DBConnect" %>
<%
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
}

    int eventId = Integer.parseInt(request.getParameter("eventId"));
%>
<html>
<head>
<title>Book Ticket</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Book Ticket</h2>
<a href="events.jsp">Back to Events</a><br><br>
<%
    try (Connection con = DBConnect.getCon()) {
        PreparedStatement pst = con.prepareStatement("SELECT * FROM events WHERE event_id = ?");
        pst.setInt(1, eventId);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
%>
<form method="post" action="BookTicketServlet">
    <input type="hidden" name="eventId" value="<%= eventId %>">
    <p>Event: <%= rs.getString("title") %></p>
    <p>Date: <%= rs.getDate("event_date") %></p>
    <p>Location: <%= rs.getString("location") %></p>
    <p>Price per ticket: <%= rs.getDouble("ticket_price") %></p>
    <p>Tickets Available: <%= rs.getInt("tickets_available") %></p>
    Quantity: <input type="number" name="quantity" min="1" max="<%= rs.getInt("tickets_available") %>" required><br><br>
    <input type="submit" value="Book Now">
</form>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>




