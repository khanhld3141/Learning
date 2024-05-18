<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <link rel="stylesheet" href="../assets/css/forgot-password/enter-code.css">
    <div class="main-content">
        <div class="form-enter-code">
            <form class="form" action="/confirm-code" method="post">
                <div class="title">OTP</div>
                <div class="title">Verification Code</div>
                <p class="message">We have sent a verification code to your email</p>
                <div class="inputs">
                    <input name="code[]" id="input1" type="text" maxlength="1">
                    <input name="code[]" id="input2" type="text" maxlength="1">
                    <input name="code[]" id="input3" type="text" maxlength="1">
                    <input name="code[]" id="input4" type="text" maxlength="1">
                    <input name="code[]" id="input5" type="text" maxlength="1">
                    <input name="code[]" id="input6" type="text" maxlength="1">
                </div>
                <button class="action" type="submit">Confirm</button>
            </form>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
