<%@ page import="java.sql.*,com.pack.event_managment_system.DBConnect" %>
<%
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head><title>All Events</title>
<link rel="stylesheet" href="style.css"></head>
<body>
<h2>Upcoming Events</h2>
<a href="dashboard.jsp">Back to Dashboard</a>
<hr>
<table border="1">
<tr>
    <th>Title</th><th>Date</th><th>Location</th><th>Price</th><th>Available</th><th>Action</th>
</tr>
<%
    try (Connection con = DBConnect.getCon()) {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM events WHERE event_date >= SYSDATE");

        while (rs.next()) {
            int eventId = rs.getInt("event_id");
%>
<tr>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getDate("event_date") %></td>
    <td><%= rs.getString("location") %></td>
    <td><%= rs.getDouble("ticket_price") %></td>
    <td><%= rs.getInt("tickets_available") %></td>
    <td><a href="book_ticket.jsp?eventId=<%= eventId %>">Book</a></td>
</tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>
</body>
</html>




