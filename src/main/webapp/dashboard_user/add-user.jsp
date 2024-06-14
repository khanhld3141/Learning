<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-users">
        <div class="manage-user__block-title manage-block">
            <h1 class="manage-user__title title">Add New Users</h1>
        </div>
        <div class="add-user add-block">
            <form action="/dashboard/create-user" method="post" class="add-user__form add-form" id="userForm">
                <div class="add-form__content">
                    <div class="name">
                        <label for="Name">Name</label>
                        <input type="text" name="Name" id="Name" placeholder="Enter name" required>
                        <span class="error-message" id="nameError"></span>
                    </div>
                    <div class="phone-email">
                        <div class="phone">
                            <label for="Phone">Phone</label>
                            <input type="number" name="Phone" id="Phone" placeholder="Enter phone" required>
                            <span class="error-message" id="phoneError"></span>
                        </div>
                        <div class="email">
                            <label for="Email">Email</label>
                            <input type="email" name="Email" id="Email" placeholder="Enter email" required>
                            <span class="error-message" id="emailError"></span>
                        </div>
                    </div>
                    <div class="username-password">
                        <div class="username">
                            <label for="Username">Username</label>
                            <input type="text" name="Username" id="Username" placeholder="Enter username" required>
                            <span class="error-message" id="usernameError"></span>
                        </div>
                        <div class="password">
                            <label for="Password">Password</label>
                            <input type="password" name="Password" id="Password" placeholder="Enter password" required>
                            <span class="error-message" id="passwordError"></span>
                        </div>
                    </div>
                    <div class="role-balance">
                        <div class="role">
                            <label for="Role">Role</label>
                            <select name="Role" id="Role">
                                <option value="R1">Admin</option>
                                <option value="R2">Teacher</option>
                                <option value="R3">Student</option>
                            </select>
                        </div>
                        <div class="balance">
                            <label for="Balance">Balance</label>
                            <input type="number" name="Balance" id="Balance" placeholder="Enter balance">
                            <span class="error-message" id="balanceError"></span>
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="/dashboard/users" class="btn__back">Back</a>
                    </div>
                </div>
            </form>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const form = document.getElementById('userForm');

                    function validateName() {
                        const name = document.getElementById('Name').value.trim();
                        const nameError = document.getElementById('nameError');
                        if (!/^[A-Za-zÀ-ỹà-ỹ]+(?: [A-Za-zÀ-ỹà-ỹ]+)*$/.test(name)) {
                            nameError.textContent = "Name must only contain letters and not start or end with whitespace.";
                            return false;
                        } else {
                            nameError.textContent = "";
                            return true;
                        }
                    }

                    function validatePhone() {
                        const phone = document.getElementById('Phone').value;
                        const phoneError = document.getElementById('phoneError');
                        if (!/^0\d{9}$/.test(phone)) {
                            phoneError.textContent = "Phone must start with 0 and be 10 digits long.";
                            return false;
                        } else {
                            phoneError.textContent = "";
                            return true;
                        }
                    }

                    function validateEmail() {
                        const email = document.getElementById('Email').value;
                        const emailError = document.getElementById('emailError');
                        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                            emailError.textContent = "Email is not valid.";
                            return false;
                        } else {
                            emailError.textContent = "";
                            return true;
                        }
                    }

                    function validateUsername() {
                        const username = document.getElementById('Username').value;
                        const usernameError = document.getElementById('usernameError');
                        if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d_]{8,}$/.test(username)) {
                            usernameError.textContent = "Username must be at least 8 characters long, contain both letters and numbers, and can include underscores.";
                            return false;
                        } else {
                            usernameError.textContent = "";
                            return true;
                        }
                    }

                    function validatePassword() {
                        const password = document.getElementById('Password').value;
                        const passwordError = document.getElementById('passwordError');
                        if (/\s/.test(password) || password.length < 8) {
                            passwordError.textContent = "Password must be at least 8 characters long and must not contain spaces.";
                            return false;
                        } else {
                            passwordError.textContent = "";
                            return true;
                        }
                    }

                    function validateBalance() {
                        const balance = document.getElementById('Balance').value;
                        const balanceError = document.getElementById('balanceError');
                        if (!/^\d+(\.\d+)?$/.test(balance) || parseFloat(balance) < 0) {
                            balanceError.textContent = "Balance must be a positive number.";
                            return false;
                        } else {
                            balanceError.textContent = "";
                            return true;
                        }
                    }

                    function validateForm() {
                        return validateName() && validatePhone() && validateEmail() && validateUsername() && validatePassword() && validateBalance();
                    }

                    form.addEventListener('submit', function(event) {
                        if (!validateForm()) {
                            event.preventDefault();
                        }
                    });

                    document.getElementById('Name').addEventListener('input', validateName);
                    document.getElementById('Phone').addEventListener('input', validatePhone);
                    document.getElementById('Email').addEventListener('input', validateEmail);
                    document.getElementById('Username').addEventListener('input', validateUsername);
                    document.getElementById('Password').addEventListener('input', validatePassword);
                    document.getElementById('Balance').addEventListener('input', validateBalance);
                });
            </script>

        </div>
    </div>
</div>
</body>
</html>