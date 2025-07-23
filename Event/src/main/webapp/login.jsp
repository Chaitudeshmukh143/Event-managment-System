<!DOCTYPE html>
<html>
<head><title>Login</title>
<link rel="stylesheet" href="style.css"></head>
<body>
    <h2>User Login</h2>
    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Invalid credentials</p>
    <% } %>
    <form action="login" method="post">
        Username: <input type="text" name="username" required><br/>
        Password: <input type="password" name="password" required><br/>
        <input type="submit" value="Login">
    </form>
    <a href="register.jsp">Don't have an account? Register</a>
</body>
</html>
