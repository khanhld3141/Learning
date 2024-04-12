
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
    <link rel="stylesheet" href="../assets/css/event/event_layout.scss">
    <link rel="stylesheet" href="../assets/css/pages/Pages-Sign-Up.css">
    <link rel="stylesheet" href="../assets/css/terms-conditions.css">
    <link rel="stylesheet" href="../assets/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/event/event-details.css">
    <link rel="stylesheet" href="../assets/css/courses/courses.css">
    <link rel="stylesheet" href="../assets/css/home_layout.css">
    <link rel="stylesheet" href="../assets/css/courses/courses_detail.css">
    <link rel="stylesheet" href="../assets/css/blog/blog.css">
    <link rel="stylesheet" href="../Component/component.css">
</head>

<body>
<!-- header -->
<header>
    <div class="main-content">
        <div class="header-content">
            <!-- logo -->
            <figure class="header__logo">
                <img src="../img/e-learning-logo.svg" alt="Header__logo" class="logo__img">
            </figure>
            <!-- navbar -->
            <div class="navbar">
                <ul class="navbar__list">
                    <li class="navbar__item">
                        <a href="../Home/layout_home.jsp">HOME</a>
                    </li>
                    <li class="navbar__item">
                        <a href="#!">ABOUT</a>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="#!">COURSES</a>
                        <i class="fa-solid fa-sort-down"></i>
                        <ul class="sub-menu">
                            <li>
                                <a href="../Courses/courses.jsp">COURSES</a>
                            </li>
                            <li>
                                <a href="../Courses/courses_details.jsp">COURSES DETAILS</a>
                            </li>
                        </ul>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="#!">BLOG</a>
                        <i class="fa-solid fa-sort-down"></i>
                        <ul class="sub-menu">
                            <li>
                                <a href="../blog/blog.jsp">BLOG</a>
                            </li>
                            <li>
                                <a href="../blog/blog-details.jsp">BLOG DETAILS</a>
                            </li>
                        </ul>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="#!">EVENTS</a>
                        <i class="fa-solid fa-sort-down"></i>
                        <ul class="sub-menu">
                            <li>
                                <a href="../Event/layout_event.jsp">EVENT</a>
                            </li>
                            <li>
                                <a href="../Event/layout_eventdetails.jsp">EVENT DETAILS</a>
                            </li>
                        </ul>
                    </li>
                    <li class="navbar__item has-child">
                        <a href="#!">PAGES</a>
                        <i class="fa-solid fa-sort-down"></i>
                        <ul class="sub-menu">
                            <li>
                                <a href="#!">PRICING</a>
                            </li>
                            <li>
                                <a href="#!">TERMS AND CONDITIONS</a>
                            </li>
                            <li>
                                <a href="#!">LOGIN</a>
                            </li>
                            <li>
                                <a href="">SIGN UP</a>
                            </li>
                        </ul>
                    </li>
                    <li class="navbar__item">
                        <a href="#!">CONTACT</a>
                    </li>
                    <li class="navbar__item">
                        <a href="#!">LOGIN</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>