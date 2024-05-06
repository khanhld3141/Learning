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
                <form action="/register" method="post" class="sl-form">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input name="Name" type="text" placeholder="Jhone Doe" required>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input name="Username" type="text" placeholder="example@gmail.com" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="Email" type="email" placeholder="example@gmail.com" required>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <input name="Password" type="password" placeholder="Password" required>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="" value="">
                        <label class="form-check-label">Agree with <a href="../Terms_Conditions">Terms and Conditions</a></label>
                    </div>
                    <button class="btn btn-filled btn-round">Signup</button>
                    <p class="notice">Already have an account? <a href="../Login/Login.jsp">Login Account</a></p>
                </form>
            </div>
        </div>
    </div>
</section>

</div>


<%@include file="../Component/footer.jsp"%>
