<%@ page import="java.sql.*,com.pack.event_managment_system.DBConnect" %>
<%
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Admin Dashboard</h2>
<a href="dashboard.jsp">Back to User Dashboard</a> | 
<a href="LogoutServlet">Logout</a>
<hr>

<h3>All Registered Users</h3>
<table border="1">
<tr><th>User ID</th><th>Username</th><th>Email</th><th>Role</th></tr>
<%
    try (Connection con = DBConnect.getCon()) {
        PreparedStatement pst = con.prepareStatement("SELECT * FROM users");
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("user_id") %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("role") %></td>
</tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>

<hr>
<h3>All Events</h3>
<table border="1">
<tr><th>Event ID</th><th>Title</th><th>Organizer ID</th><th>Date</th><th>Location</th><th>Action</th></tr>
<%
    try (Connection con = DBConnect.getCon()) {
        PreparedStatement pst = con.prepareStatement("SELECT * FROM events");
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("event_id") %></td>
    <td><%= rs.getString("title") %></td>
    <td><%= rs.getInt("user_id") %></td>
    <td><%= rs.getDate("event_date") %></td>
    <td><%= rs.getString("location") %></td>
    <td>
        <form method="post" action="DeleteEventServlet">
            <input type="hidden" name="eventId" value="<%= rs.getInt("event_id") %>">
            <input type="submit" value="Delete">
        </form>
    </td>
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
