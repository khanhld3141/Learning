<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <link rel="stylesheet" href="../assets/css/forgot-password/confirm-new-password.css">
    <div class="main-content">
        <form class="form" action="/confirm-password" method="post" onsubmit="return validateForm(event)">
            <p class="form-title">Confirm your new password</p>
            <div class="input-container">
                <input id="password" name="password" type="password" placeholder="Enter new password" required oninput="validatePassword()">
                <p id="password-error" class="error-message"></p>
            </div>
            <div class="input-container">
                <input id="confirm-password" name="password" type="password" placeholder="Enter new password again" required oninput="validateConfirmPassword()">
                <p id="confirm-password-error" class="error-message"></p>
            </div>
            <button type="submit" class="submit">Confirm</button>
            <p class="signup-link">
                <a href="/login">Back to log in</a>
            </p>
        </form>

        <script>
            function validatePassword() {
                const password = document.getElementById('password').value;
                const passwordError = document.getElementById('password-error');
                const regex = /^(?=.*\S).{8,}$/;

                if (!regex.test(password)) {
                    passwordError.textContent = 'Password must be at least 8 characters and contain no whitespace.';
                    return false;
                } else {
                    passwordError.textContent = '';
                    return true;
                }
            }

            function validateConfirmPassword() {
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirm-password').value;
                const confirmPasswordError = document.getElementById('confirm-password-error');

                if (password !== confirmPassword) {
                    confirmPasswordError.textContent = 'Passwords do not match.';
                    return false;
                } else {
                    confirmPasswordError.textContent = '';
                    return true;
                }
            }

            function validateForm(event) {
                const isPasswordValid = validatePassword();
                const isConfirmPasswordValid = validateConfirmPassword();

                if (!isPasswordValid || !isConfirmPasswordValid) {
                    event.preventDefault();
                    return false;
                }
                return true;
            }
        </script>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
