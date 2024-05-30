
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include  file="../Component/header.jsp"%>
<main>
<%--  <section class="banner-login">--%>
    <div class="main-content">
    <div class="container-login">
        <div class="row-login">
          <div class="col-md-6-login">
            <div class="content-box-login">
            <h2 class="login-header">Login Account</h2>
                 <p class="descrip-login">Lorem ipsum dolor sit amet, consectetur adipiscing elit sedo
                <br>
                eiusmod tempor incididunt dolore.
                </p>
            </div>
            <form action="/login" method="post" class="form-login">
                <div class="form-group">
                    <label>Email *</label>
                    <input name="Email" type="text" class="form-group__input" placeholder="example@gmail.com"
                           required>
                    <%
                        if(request.getAttribute("email") != null){
                    %>
                    <p style="color: red">Email is invalid</p>
                    <%
                        }
                    %>
                </div>
               <div class="form-group">
                    <label>Password *</label>
                    <input name="Password" type="password" class="form-group__input" placeholder="Password" required>
                   <%
                       if(request.getAttribute("password") != null){
                   %>
                   <p style="color: red">Password is incorrect</p>
                   <%
                       }
                   %>
               </div>
                <div class="form-check">
                    <input name="Remember" type="checkbox" class="form-check__input">
                    <label class="form-check__label">Remember Password</label>
                  
                </div>
                <button class="btn__login">
                    <span class="bh"></span>
                    <span>LOGIN</span>
                </button>
                <div class="otherlogin">
                    <p style="display: inline;">or login with</p>
                    <a class="loginwithgoogle"
                       href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/loginwithgoogle&response_type=code
		            &client_id=412850504579-nqra0ggs5bqpvlgmu0u062ajd7ua5pfv.apps.googleusercontent.com&approval_prompt=force">
                        <i class="fa-brands fa-google"></i> Google
                    </a>
                </div>
                <p class="form-notice">
                    Don't have an account? 
                    <a href="/register" class="form-signup">Signup Now</a>
                </p>
            </form>    
          </div>
          <div class="vector-img-login">
            <img src="../img/login-img/vector.png" alt>
         </div>

        </div>

    </div>
    </div>
<%--</section>--%>
</main>
<%@include  file="../Component/footer.jsp"%>