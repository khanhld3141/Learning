<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/10/2024
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="events-group__item">
    <div class="date--round">
        <h1 class="date--rount__time">${param.date}</h1>
    </div>

    <div class="content">
        <h1 class="content__time">
            <i class="ti-timer"></i>
            ${param.time}</h1>
        <a href="#!" class="content__name">${param.head}</a>
        <p class="content__text">${param.content}</p>
    </div>
</div>
