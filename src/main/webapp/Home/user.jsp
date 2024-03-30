<%@ page import="model.Users" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: MY DREAMS
  Date: 01/03/2024
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            width: 100%;

            thead {
                background: #2ecc71;
                text-align: center;
                font-size: 1.3rem;
                color: #fff;
                font-weight: 700;
            }

            td, tr {
                padding: 0.3rem 0.5rem;
                border: 0.1rem solid #ececec;
                text-align: center;
                font-size: 1.1rem;

                .btn {
                    padding: 0.5rem 1rem;
                    font-size: 1rem;
                    color: #fff;
                    border: 0.1rem solid transparent;
                    border-radius: 0.5rem;
                    cursor: pointer;
                }

                .view {
                    background: #2ecc71;
                }

                .del {
                    background: red;
                }
            }
        }
    </style>
    <script type="text/javascript">
        const handleDelete = (id) => {
            if(confirm("Are you sure you want to delete user with id " + id)){
                window.location="delete-user?id=" + id;
            }
        }
        const handleUpdate = (id) => {
            window.location="update-user?id=" + id;
        }

    </script>
</head>
<body>
<h1>Danh sách users</h1>
<a href="/create-user">Add new user</a>
<table>
    <thead>
    <tr>
        <td>
            STT
        </td>
        <td>
            ID
        </td>
        <td>
            Name
        </td>
        <td>
            University
        </td>
        <td>
            Class
        </td>
        <td>
            Grade
        </td>
        <td>
            Action
        </td>
    </tr>
    </thead>
    <tbody>
    <%
        if (request.getAttribute("users") != null) {
            List<Users> users = (List<Users>) request.getAttribute("users");
            for (int i = 0; i < users.size(); i++) {


    %>
    <tr>
        <td>
            <%=(i+1)%>
        </td>
        <td>
            <%= users.get(i).getId()%>
        </td>
        <td>
            <%= users.get(i).getName()%>
        </td>
        <td>
            <%= users.get(i).getUni()%>
        </td>
        <td>
            <%= users.get(i).getClas()%>
        </td>
        <td>
            <%= users.get(i).getGrade()%>
        </td>
        <td>
            <button onclick="handleUpdate(<%= users.get(i).getId()%>)" class="btn view">View</button>
            <button onclick="handleDelete(<%= users.get(i).getId()%>)" class="btn del">Delete</button>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>


</body>
</html>