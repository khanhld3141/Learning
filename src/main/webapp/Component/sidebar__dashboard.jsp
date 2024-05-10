<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <%-- Jquery--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- google-font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <!-- RESET CSS -->
    <link rel="stylesheet" href="../assets/css/reset.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="../Component/component__dashboard.scss">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.scss">
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/update-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-voucher/manage-voucher.css">
    <link rel="stylesheet" href="../assets/css/dashboard-voucher/add-voucher.css">
    <link rel="stylesheet" href="../assets/css/dashboard-voucher/update-voucher.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/manage-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/update-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/add-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/manage-chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-lesson/lesson.css">
    <link rel="stylesheet" href="../assets/css/dashboard-lesson/manage-lesson.css">
    <link rel="stylesheet" href="../assets/css/dashboard_category/manage-category.css">
    <link rel="stylesheet" href="../assets/css/dashboard_deposit/manage-deposit.css">
    <link rel="stylesheet" href="../assets/css/dashboard_hashtag/manage-hashtag.css">
    <link rel="stylesheet" href="../assets/css/dashboard_post/manage-post.scss">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>

<body>
<div class="side-bar">
    <div class="sidebar_user_info">
        <div class="icon_setting"></div>
        <div class="user_profle_side">
            <div class="user_img"><img class="img-user-dashboard" src="/images/${sessionScope.user.avatar}" alt="#">
            </div>
            <div class="user_info">
                <h6>${sessionScope.user.name}</h6>
                <p><span class="online_animation"></span> Online</p>
            </div>
        </div>
    </div>
    <div class="general-block">
        <h3 class="general-title">General</h3>
    </div>
    <nav class="side-bar__nav">
        <ul>
            <li>
                <a href="/dashboard" class="nav__link"><i class="fa-solid fa-table-cells" style="color: #ff9800"></i>Dashboard</a>
            </li>
            <li>
                <a href="/dashboard/users" class="nav__link"><i class="fa-solid fa-user" style="color: #ff5722"></i>Users</a>
            </li>
            <li>
                <a href="/dashboard/courses" class="nav__link"><i class="fa-solid fa-file" style="color: #03a9f4"></i>Courses</a>
            </li>
            <%--    <li>
                    <a href="/dashboard_lesson" class="nav__link"><i class="fa-solid fa-book"></i>Lesson</a>
                </li>
                <li>
                    <a href="/dashboard_chapter" class="nav__link"><i class="fa-solid fa-palette"></i>Chapter</a>
                </li>--%>
            <li>
                <a href="/dashboard/categories" class="nav__link"><i class="fa-solid fa-palette"
                                                                     style="color: #9c27b0"></i>Category</a>
            </li>
            <li>
                <a href="/dashboard/vouchers" class="nav__link"><i class="fa-solid fa-ticket"
                                                                   style="color: #e91e63"></i>Voucher</a>
            </li>
            <li>
                <a href="/dashboard/hashtags" class="nav__link"><i class="fa-solid fa-hashtag"
                                                                  style="color:  #ff9800"></i>Hastags</a>
            </li>
            <li>
                <a href="/dashboard/deposits" class="nav__link"><i class="fa-solid fa-receipt"
                                                                   style="color: #009688"></i>Deposit</a>
            </li>
            <li>
                <a href="/dashboard/posts" class="nav__link"><i class="fa-solid fa-blog" style="color: #ff9800"></i>Posts</a>
            </li>
            <% if (session.getAttribute("user") != null) { %>
            <li>
                <a href="/logout" class="nav__link"><i class="fa-solid fa-right-from-bracket"
                                                       style="color: #e91e63"></i>Log out</a>
            </li>
            <% } %>
        </ul>
    </nav>
    <script>
        let dashboardItemElement = document.querySelectorAll(".nav__link");
        var currentUrl = window.location.pathname;
        console.log("sss:  " + currentUrl);
        for (let item of dashboardItemElement) {
            console.log(item.getAttribute("href"));
            if (item.getAttribute("href") === currentUrl) {
                item.parentElement.classList.add("active__side-bar");
            }
        }
    </script>
</div>