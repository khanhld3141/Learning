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
                                </div>
                                <div class="new-password-again">
                                    <label for="New-password-again"><i class="fa-solid fa-key"></i>New password
                                        again
                                    </label>
                                    <input type="password" id="New-password-again"
                                           placeholder="Enter your new password again" required>
                                </div>
                                <div class="submit-change-password">
                                    <button type="submit"
                                            class="btn__profile btn__submit-change-password">Confirm</button>
                                </div>
                            </form>
                            <script>
                                document.addEventListener("DOMContentLoaded", function() {
                                    var form = document.querySelector('#form_change_password');
                                    form.addEventListener('submit', function(event) {
                                        event.preventDefault();
                                        validatePassword();
                                    });

                                    function validatePassword() {
                                        var newPassword = document.getElementById('New-password').value;
                                        var confirmPassword = document.getElementById('New-password-again').value;

                                        if (newPassword !== confirmPassword) {
                                            alert('New password and confirm password do not match!');
                                        } else {
                                            form.submit();
                                        }
                                    }
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