<%--
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
    <link rel="stylesheet" type="text/css" href="Home/add.scss"/>
</head>
<body>
<h1>
    Add new user
</h1>

<form action="/upload" method="post" enctype="multipart/form-data">
   <input type="file" name="image"/>
    <img src="/images/60936a5d-4a92-4c68-9680-7f3122e93ec1_banner-11.png"%>
    <video width="500" height="300" controls>
        <source src="/images/video11.mp4" type="video/mp4">
        Trinh duyet cua ban khong ho tro the video.
    </video>
    <button type="submit">Add</button>
</form>
</body>
</html>
