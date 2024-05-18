<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <link rel="stylesheet" href="../assets/css/forgot-password/confirm-new-password.css">
    <div class="main-content">
        <form class="form" action="/confirm-password" method="post">
            <p class="form-title">Confirm your new password</p>
            <div class="input-container">
                <input name="password" type="password" placeholder="Enter new password">
            </div>
            <div class="input-container">
                <input name="password" type="password" placeholder="Enter new password again">
            </div>
            <button type="submit" class="submit">Confirm</button>
            <p class="signup-link">
                <a href="/login">Back to log in</a>
            </p>
        </form>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
