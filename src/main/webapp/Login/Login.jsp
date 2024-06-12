
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
                    <p style="margin-bottom: 20px; font-weight: 450; color: red; margin-top: -17px;">Email is invalid</p>
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
                   <p style="margin-bottom: 20px; font-weight: 450; color: red; margin-top: -17px;">Password is incorrect</p>
                   <%
                       }
                   %>
               </div>
                <div class="form-check" style="display: flex; justify-content: space-between">
                    <div>
                        <input name="Remember" type="checkbox" class="form-check__input">
                        <label class="form-check__label">Remember Password</label>
                    </div>
                    <div>
                        <a href="/forgot-password" style="color: red">Forgot password</a>
                    </div>
                  
                </div>
                <button class="btn__login" style="width: 100%">
                    <span class="bh"></span>
                    <span>LOGIN</span>
                </button>
                <div class="otherlogin" style="border: none; margin: 0; padding: 12px 0">
                    <p style="text-align: center; padding-bottom: 12px">Or</p>
                    <a class="loginwithgoogle"
                       href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/loginwithgoogle&response_type=code
		            &client_id=412850504579-nqra0ggs5bqpvlgmu0u062ajd7ua5pfv.apps.googleusercontent.com&approval_prompt=force">
                        <img src="../img/login-img/icons8-google.svg" alt="">
                        <p style="padding: 5px">Login with Google</p>
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
<%@include  file="../Component/footer.jsp"%>