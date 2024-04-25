<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-users">
        <div class="manage-user__block-title manage-block">
            <h1 class="manage-user__title title">Update Users</h1>
        </div>
        <div class="update-user update-block">
            <form action="/dashboard/update-user" method="post" class="update-user__form update-form">
                <%
                    if (request.getAttribute("user") == null) {
                %>
                <h3>User not found</h3>
                <%
                    }
                %>

                <%
                    if (request.getAttribute("user") != null) {
                        User user = (User) request.getAttribute("user");
                %>
                <div class="update-form__content">
                    <input hidden name="Id" value="<%=user.getId()%>"/>
                    <div class="name">
                        <label for="Name">Name</label>
                        <input value=<%=user.getName()%> type="text" name="Name" id="Name" placeholder="Enter name">
                    </div>
                    <div class="phone-email">
                        <div class="phone">
                            <label for="Phone">Phone</label>
                            <input value=<%=user.getPhone()%> type="text" name="Phone" id="Phone"
                                   placeholder="Enter phone">
                        </div>
                        <div class="email">
                            <label for="Email">Email</label>
                            <input value=<%=user.getEmail()%> type="email" name="Email" id="Email"
                                   placeholder="Enter email">
                        </div>
                    </div>
                    <div class="username-password">
                        <div class="username">
                            <label for="Username">Username</label>
                            <input  value=<%=user.getUsername()%> type="text" name="Username" id="Username"
                                    placeholder="Enter username">
                        </div>
                        <div class="password">
                            <label for="Password">Password</label>
                            <input value=<%=user.getPassword()%>  type="text" name="Password" id="Password"
                                   placeholder="Enter password">
                        </div>
                    </div>
                    <div class="role-balance">
                        <div class="role">
                            <label for="Role">Role</label>
                            <select  name="Role" id="Role">
                                <option <%=(user.getRole().equals("R1")) ? "selected" : ""%> value="R1">Admin</option>
                                <option <%=(user.getRole().equals("R2")) ? "selected" : ""%> value="R2">Teacher</option>
                                <option <%=(user.getRole().equals("R3")) ? "selected" : ""%> value="R3">Student</option>
                            </select>
                        </div>
                        <div class="balance">
                            <label for="Balance">Balance</label>
                            <input value=<%=user.getBanlance()%> type="number" name="Balance" id="Balance"
                                   placeholder="Enter balance">
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="/dashboard/users" class="btn__back">Back</a>
                    </div>
                </div>
                <%
                    }
                %>
            </form>
        </div>
    </div>
</div>
</body>
</html>