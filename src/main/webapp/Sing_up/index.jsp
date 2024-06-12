<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/9/2024
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>


<div class="sign-up">
<section class="banner login-registration">


    <div class="main-content">

        <div class="row">

<%--            form dang kí--%>
            <div class="col-md-6">

<%--                ảnh--%>
                <div class="vector-img">
                    <img src="../img/pages-img/teacher.png" alt="">
                </div>

                <div class="content-box">
                    <h2>Create Account</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit sedo<br> eiusmod tempor incididunt dolore.</p>
                </div>
    <form action="/register" method="post" class="sl-form" onsubmit="return validateForm(event)">
        <div class="form-group">
            <label>Full Name</label>
            <input name="Name" type="text" placeholder="Enter full name" required oninput="validateName()">
            <p id="name-error" class="error-message"></p>
        </div>
        <div class="form-group">
            <label>Username</label>
            <input name="Username" type="text" placeholder="Enter username" required oninput="validateUsername()">
            <p id="username-error" class="error-message"></p>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input name="Email" type="email" placeholder="Enter email" required oninput="validateEmail()">
            <p id="email-error" class="error-message"></p>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input name="Password" type="password" placeholder="Enter password" required oninput="validatePassword()">
            <p id="password-error" class="error-message"></p>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" name="terms" value="" required>
            <label class="form-check-label">Agree with <a href="../Terms_Conditions">Terms and Conditions</a></label>
        </div>
        <button type="submit" class="btn btn-filled btn-round" style="width: 100%">Signup</button>
        <p class="notice">Already have an account? <a href="../Login/Login.jsp">Login Account</a></p>
    </form>

    <script>
        function validateName() {
            const name = document.querySelector('[name="Name"]').value;
            const nameError = document.getElementById('name-error');
            const regex = /^[a-zA-ZÀ-ỹ\s]+$/u;

            if (!regex.test(name)) {
                nameError.textContent = 'Name must contain only letters and spaces.';
                return false;
            } else {
                nameError.textContent = '';
                return true;
            }
        }

        function validateUsername() {
            const username = document.querySelector('[name="Username"]').value;
            const usernameError = document.getElementById('username-error');
            const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d_]{8,}$/;

            if (!regex.test(username)) {
                usernameError.textContent = 'Username must be at least 8 characters long, contain letters and numbers, and may include underscores.';
                return false;
            } else {
                usernameError.textContent = '';
                return true;
            }
        }

        function validateEmail() {
            const email = document.querySelector('[name="Email"]').value;
            const emailError = document.getElementById('email-error');
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!regex.test(email)) {
                emailError.textContent = 'Email must be in the correct format.';
                return false;
            } else {
                emailError.textContent = '';
                return true;
            }
        }

        function validatePassword() {
            const password = document.querySelector('[name="Password"]').value;
            const passwordError = document.getElementById('password-error');
            const regex = /^(?=.*\S).{8,}$/;

            if (!regex.test(password) || /\s/.test(password)) {
                passwordError.textContent = 'Password must be at least 8 characters long and contain no spaces.';
                return false;
            } else {
                passwordError.textContent = '';
                return true;
            }
        }

        function validateForm(event) {
            const isNameValid = validateName();
            const isUsernameValid = validateUsername();
            const isEmailValid = validateEmail();
            const isPasswordValid = validatePassword();

            if (!isNameValid || !isUsernameValid || !isEmailValid || !isPasswordValid) {
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
            </div>
        </div>
    </div>
</section>

</div>


<%@include file="../Component/footer.jsp"%>
