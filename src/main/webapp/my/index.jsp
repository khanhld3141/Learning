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
                            <div class="change-avt-box">
                                <form class="change-avt__form">
                                    <figure>
                                        <img src="../img/avt-default-1.jpg" alt="" class="personal-infor__avt"
                                             id="personal-infor__avt">
                                    </figure>
                                    <input type="file" class="btn__profile btn__change-avt">
                                </form>
                            </div>
                            <div class="personal-infor-box">
                                <form class="personal-infor__form">
                                    <div class="name">
                                        <label for="Name"><i class="fa-solid fa-user-tie"></i>Your Name</label>
                                        <input type="text" id="Name" placeholder="Enter your name" name="Name">
                                    </div>
                                    <div class="email">
                                        <label for="Email"><i class="fa-solid fa-envelope"></i>Your Email</label>
                                        <input type="email" id="Email" placeholder="Enter your email" name="Email">
                                    </div>
                                    <div class="phone">
                                        <label for="Phone"><i class="fa-solid fa-phone"></i>Your Number
                                            Phone</label>
                                        <input type="number" id="Phone" placeholder="Enter your number phone"
                                               name="Phone">
                                    </div>
                                    <button type="submit"
                                            class="btn__profile btn__submit-personal-infor">Update</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp"%>