<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp"%>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="personal-infor">
                        <h2 class="profile-right__title">Personal information</h2>
                        <div class="profile-right__content">
                            <%
                                if(request.getAttribute("user")!=null){
                                    User user=(User)request.getAttribute("user");
                            %>
                            <div class="change-avt-box">
                                <form class="change-avt__form">
                                    <figure>
                                        <img src="/images/<%=user.getAvatar()%>" alt="" class="personal-infor__avt"
                                             id="personal-infor__avt">
                                    </figure>
                                    <input name="image" id="imageUpload" type="file"
                                           class="btn__profile btn__change-avt">
                                </form>
                            </div>
                            <div class="personal-infor-box">

                                <form action="/my-profile" method="post" class="personal-infor__form">
                                    <div class="name">
                                        <label for="Name"><i class="fa-solid fa-user-tie"></i>Your Name</label>
                                        <input value="<%=user.getName()%>" type="text" id="Name"
                                               placeholder="Enter your name"
                                               name="name">
                                    </div>
                                    <div class="email">
                                        <label for="Email"><i class="fa-solid fa-envelope"></i>Your Email</label>
                                        <input value="<%=user.getEmail()%>" type="email" id="Email" placeholder="Enter your email"
                                                     name="email">
                                    </div>
                                    <div class="phone">
                                        <label for="Phone"><i class="fa-solid fa-phone"></i>Your Number
                                            Phone</label>
                                        <input value="<%=user.getPhone()%>" type="text" id="Phone"
                                               placeholder="Enter your number phone"
                                               name="phone">
                                    </div>
                                    <button type="submit"
                                            class="btn__profile btn__submit-personal-infor">Update</button>
                                </form>

                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $('#imageUpload').change(function(){
            var formData = new FormData();
            formData.append('image', $('#imageUpload')[0].files[0]);
            $.ajax({
                url: '/upload-user-image',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,

                success: function(response){
                    location.reload();
                }
            });
        });
    });
</script>
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
<%@include file="../Component/footer.jsp"%>