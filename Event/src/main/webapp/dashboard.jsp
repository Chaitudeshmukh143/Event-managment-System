<%@ page import="java.sql.*, com.pack.event_managment_system.DBConnect" %>
<%
    
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

 
    int userId = (Integer) session.getAttribute("userId");
%>

<html>
<head><title>Dashboard</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Welcome, <%= session.getAttribute("username") %></h2>
<a href="create_event.jsp">Create New Event</a> |
<a href="events.jsp">View All Events</a> |
<a href="LogoutServlet">Logout</a>
<hr>
<h3>Your Events</h3>

<table border="1">
<tr>
    <th>Title</th>
    <th>Date</th>
    <th>Location</th>
    <th>Tickets</th>
</tr>

<%

    try (Connection con = DBConnect.getCon()) {
        PreparedStatement pst = con.prepareStatement("SELECT * FROM events WHERE user_id = ?");
        pst.setInt(1, userId);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
%>
<tr>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getDate("event_date") %></td>
    <td><%= rs.getString("location") %></td>
    <td><%= rs.getInt("tickets_available") %>/<%= rs.getInt("total_tickets") %></td>
</tr>
<%
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
    }
%>

</table>
</body>
</html>


