<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MY DREAMS
  Date: 02/03/2024
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .container {
            width: 40%;
            margin: auto;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            align-items: center;

            h1 {
                font-size: 3rem;
                font-weight: 700;
                text-align: center;
            }

            form {
                padding: 1rem;
                border: 1px solid #ececec;
                border-radius: 0.1rem;
                display: flex;
                flex-direction: column;
                gap: 1rem;

                .input {
                    display: flex;
                    gap: 0.5rem;
                    input{
                        padding: 0.8rem;
                        border: 0.1rem solid #ececec;
                        border-radius: 0.3rem;
                        font-size: 1rem;
                        outline: none;
                        &:focus-visible,
                        &:focus-within,
                        &:focus{
                            border:0.1rem solid #2ecc71;
                        }
                    }
                    label{
                        color: #7e7e7e;
                        font-weight: 500;

                    }
                }

                button {
                    width: fit-content;
                    border: 0.1rem solid #ececec;
                    color: white;
                    background: #2ecc71;
                    font-weight: 700;
                    font-size: 0.9rem;
                    border-radius: 0.5rem;
                    padding: 1rem;
                    cursor: pointer;
                }
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Login form</h1>
    <c:set var="cookie" value="${pageContext.request.cookies}"/>
    <form action="/login" method="post">
        <div class="input">
            <label for="username">Username</label>
            <input id="username" value="${cookie.username.value}" type="text" name="username"
                   placeholder="Nhập username"/>
        </div>
        <div class="input">
            <label for="password">Password</label>
            <input id="password" value="${cookie.password.value}" type="text" name="password"
                   placeholder="Nhập password"/>
        </div>
        <div class="input">
            <input id="remember" value="on" ${cookie.remember.value != null ? 'checked' :''} type="checkbox"
                   name="remember"/>
            <label for="remember">Remember me?</label>
        </div>

        <h3 style="color:red">
            ${requestScope.error}
        </h3>

        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
