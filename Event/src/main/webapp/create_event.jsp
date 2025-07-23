<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
if (session == null || session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head><title>Create Event</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<h2>Create New Event</h2>
<form method="post" action="CreateEventServlet">
    Title: <input type="text" name="title" required><br><br>
    Description: <textarea name="description" required></textarea><br><br>
    Date (YYYY-MM-DD): <input type="date" name="eventDate" required><br><br>
    Location: <input type="text" name="location" required><br><br>
    Ticket Price: <input type="number" name="price" required step="0.01"><br><br>
    Total Tickets: <input type="number" name="tickets" required><br><br>
    <input type="submit" value="Create Event">
</form>
<a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>



