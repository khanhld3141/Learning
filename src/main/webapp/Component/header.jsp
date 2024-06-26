<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- RESET CSS -->
    <link rel="stylesheet" href="../assets/css/reset.css">
    <!-- google-font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <!-- owl carousel lib -->
    <link rel="stylesheet" href="../owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="../owlcarousel/assets/owl.theme.default.min.css">
    <!-- jquery lib -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="../owlcarousel/owl.carousel.min.js"></script>
    <!-- component CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script src="../assets/js/notify/notify.js"></script>
    <script src="../assets/js/comment-reply/comment-reply.js"></script>
    <link rel="stylesheet" href="../assets/css/event/event_layout.css">
    <link rel="stylesheet" href="../assets/css/pages/Pages-Sign-Up.css">
    <link rel="stylesheet" href="../assets/css/terms-conditions.css">
    <link rel="stylesheet" href="../assets/css/event/event-details.css">
    <link rel="stylesheet" href="../assets/css/courses/courses.css">
    <link rel="stylesheet" href="../assets/css/home_layout.css">
    <link rel="stylesheet" href="../assets/css/courses/courses_detail.css">
    <link rel="stylesheet" href="../assets/css/blog/blog.css">
    <link rel="stylesheet" href="../assets/css/blog/blog_details.css">
    <link rel="stylesheet" href="../Component/component.css">
    <link rel="stylesheet" href="../assets/css/pages/pricing.css">
    <link rel="stylesheet" href="../assets/css/Contact/Contact.css">
    <link rel="stylesheet" href="../assets/css/Login/Login.css">
    <link rel="stylesheet" href="../assets/css/About/About.css">
    <link rel="stylesheet" href="../assets/css/Profile/personal_information.css">
    <link rel="stylesheet" href="../assets/css/Profile/change-password.css">
    <link rel="stylesheet" href="../assets/css/Profile/courses-participated.css">
    <link rel="stylesheet" href="../assets/css/payment/payment.css">
    <link rel="stylesheet" href="../assets/css/Blog-user/post-user.scss">
    <link rel="stylesheet" href="../assets/css/notify/validate_error.css">

</head>

<body>
<!-- header -->
<header>
    <div class="main-content">
        <div class="header-content">
            <!-- logo -->
            <figure class="header__logo">
                <a href="/home"><img src="../img/icons8-education-100.png" alt="Header__logo" class="logo__img"
                                     style="width: 70px"></a>
            </figure>
            <!-- navbar -->
            <div class="navbar">
                <ul class="navbar__list">
                    <li class="navbar__item">
                        <a href="/home">HOME</a>
                    </li>
                    <li class="navbar__item">
                        <a href="/about">ABOUT</a>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="/courses">COURSES</a>
                        <%--                        <i class="fa-solid fa-sort-down"></i>--%>
                        <%--                        <ul class="sub-menu">--%>
                        <%--                            <li>--%>
                        <%--                                <a href="/courses">COURSES</a>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <a href="../Courses_details">COURSES DETAILS</a>--%>
                        <%--                            </li>--%>
                        <%--                        </ul>--%>
                        <%--                    </li>--%>
                    <li class="navbar__item has-child">
                        <a href="/blogs">POSTS</a>
                        <%--                        <i class="fa-solid fa-sort-down"></i>--%>
                        <%--                        <ul class="sub-menu">--%>
                        <%--                            <li>--%>
                        <%--                                <a href="/blogs">BLOG</a>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <a href="/blog-details?id=6">BLOG DETAILS</a>--%>
                        <%--                            </li>--%>
                        <%--                        </ul>--%>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="/event">EVENTS</a>
                        <%--                        <i class="fa-solid fa-sort-down"></i>--%>
                        <%--                        <ul class="sub-menu">--%>
                        <%--                            <li>--%>
                        <%--                                <a href="/event">EVENT</a>--%>
                        <%--                            </li>--%>
                        <%--                            <li>--%>
                        <%--                                <a href="../Event_details">EVENT DETAILS</a>--%>
                        <%--                            </li>--%>
                        <%--                        </ul>--%>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="#!">PAGES</a>
                        <i class="fa-solid fa-sort-down"></i>
                        <ul class="sub-menu">
                            <li>
                                <a href="/pricing">PRICING</a>
                            </li>
                            <li>
                                <a href="/term-and-conditions">TERMS AND CONDITIONS</a>
                            </li>
                            <li>
                                <a href="/login">LOGIN</a>
                            </li>
                            <li>
                                <a href="/register">SIGN UP</a>
                            </li>
                        </ul>
                    </li>
                    <li class="navbar__item">
                        <a href="/contact">CONTACT</a>
                    </li>

                    <%
                        if (session.getAttribute("user") == null) {
                    %>
                    <li class="navbar__item">
                        <a href="/login">LOGIN</a>
                    </li>
                    <%
                    } else {
                    %>
                    <li class="navbar__item">
                        <a>$${sessionScope.user.balance}</a>
                    </li>
                    <li class="navbar__item has-child">
                        <div class="avatar">
                            <a href="#!"><img src="images/${sessionScope.user.avatar}" class="avatar-user" alt="Avatar"
                                              title="Avatar" style="object-fit: cover"></a>
                            <ul class="sub-menu-profile">
                                <li>
                                    <a href="/my-profile">SEE ALL PROFILE</a>
                                </li>
                                <li>
                                    <a href="/deposits">Deposit</a>
                                </li>
                                <%
                                    User user = (User) session.getAttribute("user");
                                    if (user.getRole().equals("R1") || user.getRole().equals("R2")) { %>
                                <li><a href="/dashboard">DASHBOARD</a></li>
                                <% } %>
                                <li>
                                    <a href="/logout">LOG OUT</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <%
                        }
                    %>

                </ul>
            </div>
        </div>
    </div>
</header>