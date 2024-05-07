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
<%@include file="../Component/footer.jsp"%>