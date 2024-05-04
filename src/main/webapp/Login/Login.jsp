
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
                    <label>Email or Username</label>
                    <input name="Username" type="text" class="form-group__input" placeholder="example@gmail.com"
                           required>

                </div>
               <div class="form-group">
                    <label>Password</label>
                    <input name="Password" type="password" class="form-group__input" placeholder="Password" required>

               </div>
                <div class="form-check">
                    <input name="Remember" type="checkbox" class="form-check__input">
                    <label class="form-check__label">Remember Password</label>
                  
                </div>
                <button class="btn__login">
                    <span class="bh"></span>
                    <span>LOGIN</span>
                </button>
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