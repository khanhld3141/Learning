<%@ page import="model.Users" %><%--
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
    <style>
        form{
            width: 70%;
            margin:auto;
            padding: 2rem;
            border: 1px solid #ececec;

            display: grid;
            grid-template-columns: repeat(1,1fr);
            gap: 0.5rem;

            label{
                font-size:1.5rem;
                color: #2f3542;
                font-weight: 700;

            }
            input{
                padding: 1rem;
                font-size:1.1rem;
                border: 0.1rem solid #ececec;
                border-radius:0.5rem;
            }
            button{
                padding: 1rem 3rem;
                border: 0.1rem solid #ececec;
                border-radius: 0.5rem;
                width: fit-content;
                background: #2ecc71;
                font-size: 1.3rem;
                font-weight: 700;
                color: #fff;
            }
        }
    </style>
</head>
<body>
<h1>
    Update user
</h1>
    <form action="/update-user" method="post">
        <%
            if(request.getAttribute("user") != null){
                Users user=(Users) request.getAttribute("user");
        %>
        <input type="text" name="id" value="<%= user.getId()%>" hidden/>
        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="<%= user.getName()%>" placeholder="<%= user.getName()%>"/>
        <label for="uni">University</label>
        <input type="text" id="uni" name="university" value="<%= user.getUni()%>" placeholder="<%= user.getUni()%>"/>
        <label for="class">Class</label>
        <input type="text" id="class" name="class" value="<%= user.getClas()%>" placeholder="<%= user.getClas()%>"/>
        <label for="grade">Grade</label>
        <input type="text" id="grade" name="grade" value="<%= user.getGrade()%>" placeholder="<%= user.getGrade()%>"/>
        <button type="submit">Update</button>

        <%
            } else if (request.getAttribute("user")!= null) {

        %>
        <p>User not found</p>
        <%
            }
        %>
    </form>
</body>
</html>
