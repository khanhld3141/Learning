<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp"%>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="courses-participated">
                        <h2 class="profile-right__title">Change password</h2>
                        <div class="change-password-box">
                            <form action="/change-password" method="post" id="form_change_password"
                                  class="change-password__form">
                                <div class="old-password">
                                    <label for="Old-password"><i class="fa-solid fa-key"></i>Your old
                                        password</label>
                                    <input type="password" id="Old-password" placeholder="Enter your old password"
                                           name="oldpassword" required>
                                </div>
                                <div class="new-password">
                                    <label for="New-password"><i class="fa-solid fa-key"></i>Your new
                                        password</label>
                                    <input type="password" id="New-password" placeholder="Enter your new password"
                                           name="newpassword" required>
                                    <span class="error-message" id="newPasswordError"></span>
                                </div>
                                <div class="new-password-again">
                                    <label for="New-password-again"><i class="fa-solid fa-key"></i>New password
                                        again
                                    </label>
                                    <input type="password" id="New-password-again"
                                           placeholder="Enter your new password again" required>
                                    <span class="error-message" id="againPasswordError"></span>
                                </div>
                                <div class="submit-change-password">
                                    <button type="submit"
                                            class="btn__profile btn__submit-change-password">Confirm</button>
                                </div>
                            </form>

<%--                            <script>--%>
<%--                                document.addEventListener("DOMContentLoaded", function() {--%>
<%--                                    var form = document.querySelector('#form_change_password');--%>
<%--                                    form.addEventListener('submit', function(event) {--%>
<%--                                        event.preventDefault();--%>
<%--                                        validatePassword();--%>
<%--                                    });--%>

<%--                                    function validatePassword() {--%>
<%--                                        var newPassword = document.getElementById('New-password').value;--%>
<%--                                        var confirmPassword = document.getElementById('New-password-again').value;--%>

<%--                                        if (newPassword !== confirmPassword) {--%>
<%--                                            alert('New password and confirm password do not match!');--%>
<%--                                        } else {--%>
<%--                                            form.submit();--%>
<%--                                        }--%>
<%--                                    }--%>
<%--                                });--%>
<%--                            </script>--%>
                            <script>
                                $(document).ready(function () {
                                    function validatePassword() {
                                        var isValid = true;

                                        var newPassword = $('#New-password').val().trim();
                                        if (newPassword.length < 8 || newPassword.includes(' ')) {
                                            $('#newPasswordError').text("New password must be at least 8 characters long and cannot contain spaces.");
                                            isValid = false;
                                        } else {
                                            $('#newPasswordError').text("");
                                        }

                                        var againPassword = $('#New-password-again').val().trim();
                                        if (againPassword !== newPassword) {
                                            $('#againPasswordError').text("Passwords do not match.");
                                            isValid = false;
                                        } else {
                                            $('#againPasswordError').text("");
                                        }

                                        return isValid;
                                    }

                                    $('#New-password, #New-password-again').on('input', function () {
                                        validatePassword();
                                    });

                                    $('#form_change_password').submit(function (event) {
                                        if (!validatePassword()) {
                                            event.preventDefault();
                                        }
                                    });
                                });

                            </script>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script type="text/javascript">
    function showToast(message, type) {
        let backgroundColor, className;
        if (type === "1") {
            backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
            className = "success"
        } else if (type === "0") {
            backgroundColor = "linear-gradient(to right, #ff5f6d, #ffc371)";
            className = "error"
        }

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "bottom",
            position: "right",
            backgroundColor: backgroundColor,
            stopOnFocus: true,
            className: className,

        }).showToast();
    }
    window.addEventListener('pageshow', function(event) {
        if (event.persisted) {
            window.location.reload();
        }
    });
    <%
        if (session.getAttribute("success")!=null) {
    %>
    showToast("<%= session.getAttribute("success") %>", "1");
    <%
    session.setAttribute("success",null);
      }
    %>

    <%

      if (session.getAttribute("error")!=null) {
  %>
    showToast("<%= session.getAttribute("error") %>", "0");
    <%
    session.setAttribute("error",null);
      }
    %>
</script>