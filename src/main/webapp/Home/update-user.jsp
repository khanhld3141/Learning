<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: MY DREAMS
  Date: 01/03/2024
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="Home/update.scss"/>
</head>
<body>
<h1>
    Update user
</h1>
<form action="/update-user" method="post">
    <%
        if (request.getAttribute("user") != null) {
            User user = (User) request.getAttribute("user");
    %>
    <input type="text" name="Id" value="<%= user.getId()%>" hidden/>

    <label for="name">Name</label>
    <input value="<%= user.getName()%>" type="text" id="name" name="Name" placeholder="Enter your name"/>

    <label for="username">Username</label>
    <input value="<%= user.getUsername()%>" type="text" id="username" name="Username"
           placeholder="Enter your username"/>

    <label for="email">Email</label>
    <input value="<%= user.getEmail()%>" type="email" id="email" name="Email" placeholder="Enter your email"/>

    <label for="password">Password</label>
    <input value="<%= user.getPassword()%>" type="password" id="password" name="Password"
           placeholder="Enter your password"/>

    <label for="phone">Phone</label>
    <input value="<%= user.getPhone()%>" type="text" id="phone" name="Phone" placeholder="Enter your phone"/>

    <label for="balance">Balance</label>
    <input value="<%= user.getBanlance()%>" type="number" id="balance" min="0" name="Balance"
           placeholder="Enter your balance"/>

    <label for="password">Role</label>
    <input value="<%= user.getRole()%>" type="text" id="role" name="Role" placeholder="Enter your role"/>
    <button type="submit">Update</button>

    <%
    } else if (request.getAttribute("user") != null) {

    %>
    <p>User not found</p>
    <%
        }
    %>
</form>
</body>
</html>
