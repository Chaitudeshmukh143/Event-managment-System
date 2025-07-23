<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pack.event_managment_system.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Event Management System</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: #f8f9fa;
    }
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .btn-custom {
        background: linear-gradient(45deg, #4e54c8, #8f94fb);
        color: #fff;
        border: none;
    }
    .btn-custom:hover {
        background: linear-gradient(45deg, #8f94fb, #4e54c8);
    }
</style>
<link rel="stylesheet" href="style.css">

</head>
<body>

<div class="container mt-5">
    <div class="text-center">
        <h1 class="mb-4 text-primary">Event Management System</h1>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card p-4 text-center">
                <h3 class="mb-3">Dashboard</h3>
                <a href="register.jsp" class="btn btn-custom mb-2 w-100">Register User</a>
                <a href="createEvent.jsp" class="btn btn-custom mb-2 w-100">Create Event</a>
                <a href="ViewEventsServlet" class="btn btn-custom mb-2 w-100">View Events</a>
                <a href="bookTickets.jsp" class="btn btn-custom w-100">Book Ticket</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>

