<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>
<div class="content-admin">
    <div class="manage-users">
        <div class="manage-user__block-title manage-block">
            <h1 class="manage-user__title title">Update Users</h1>
        </div>
        <div class="update-user update-block">
            <form class="update-user__form update-form">
                <div class="update-form__content">
                    <div class="name">
                        <label for="Name">Name</label>
                        <input type="text" name="Name" id="Name" placeholder="Enter name">
                    </div>
                    <div class="phone-email">
                        <div class="phone">
                            <label for="Phone">Phone</label>
                            <input type="number" name="Phone" id="Phone" placeholder="Enter phone">
                        </div>
                        <div class="email">
                            <label for="Email">Email</label>
                            <input type="email" name="Email" id="Email" placeholder="Enter email">
                        </div>
                    </div>
                    <div class="username-password">
                        <div class="username">
                            <label for="Username">Username</label>
                            <input type="text" name="Username" id="Username" placeholder="Enter username">
                        </div>
                        <div class="password">
                            <label for="Password">Password</label>
                            <input type="password" name="Password" id="Password" placeholder="Enter password">
                        </div>
                    </div>
                    <div class="role-balance">
                        <div class="role">
                            <label for="Role">Role</label>
                            <select name="Role" id="Role">
                                <option value="Teacher">Teacher</option>
                                <option value="Student">Student</option>
                            </select>
                        </div>
                        <div class="balance">
                            <label for="Balance">Balance</label>
                            <input type="number" name="Balance" id="Balance" placeholder="Enter balance">
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="../dashboard_user" class="btn__back">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>