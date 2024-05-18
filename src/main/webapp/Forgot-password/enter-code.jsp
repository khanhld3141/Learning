<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <link rel="stylesheet" href="../assets/css/forgot-password/enter-code.css">
    <div class="main-content">
        <div class="form-enter-code">
            <form class="form">
                <div class="title">OTP</div>
                <div class="title">Verification Code</div>
                <p class="message">We have sent a verification code to your email</p>
                <div class="inputs">
                    <input id="input1" type="text" maxlength="1">
                    <input id="input2" type="text" maxlength="1">
                    <input id="input3" type="text" maxlength="1">
                    <input id="input4" type="text" maxlength="1">
                    <input id="input5" type="text" maxlength="1">
                    <input id="input6" type="text" maxlength="1">
                </div>
                <button class="action" type="submit">Confirm</button>
            </form>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
