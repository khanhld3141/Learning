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
    <!-- google-font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <!-- RESET CSS -->
    <link rel="stylesheet" href="../assets/css/reset.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="../Component/component__dashboard.css">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
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

</head>

<body>
<div class="side-bar">
    <a href="#!">
        <svg class="side-bar__logo" xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision"
             text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd"
             clip-rule="evenodd" viewBox="0 0 418 512.535">
            <path fill="currentColor"
                  d="M40.896 237.026c.444-78.78.889-144.007 1.336-222.478.018-5.233 3.732-9.586 8.658-10.603l-.004-.015c53.592-11.186 123.886.624 158.684 46.863C246.233 5.818 313.831-4.137 368.173 3.804c5.425.795 9.33 5.457 9.325 10.785.02 0 .011 205.116.011 223.403 0 6.029-4.887 10.916-10.915 10.916-.871 0-1.718-.105-2.527-.294-20.718-3.267-48.53-1.344-70.273 4.484l-.181 20.595c3.1-.091 6.2-.125 9.3-.106 27.864.177 65.683 4.722 93.256 11.83 0-82.659-.011-151.791-.011-234.435h10.927c6.027 0 10.915 4.887 10.915 10.916v237.8c0 6.028-4.888 10.916-10.915 10.916-1.231 0-2.414-.205-3.519-.58-24.055-6.888-54.318-11.953-80.722-13.867 1.621 2.518 2.854 5.38 3.784 8.476h13.992c.563 0 1.111.065 1.636.189 12.586 2.019 18.453 10.811 21.008 22.01a7.141 7.141 0 011.896-.255h9.848c.564 0 1.113.066 1.64.191 27.033 4.324 26.638 39.142 26.379 61.855-.008.761-.017 1.479-.017 5.486l.565 25.171c.016.263.019.529.007.799-1.209 24.503-12.31 43.636-23.751 63.356l-.969 1.692c-5.047 8.826-10.9 15.567-17.568 20.177-6.788 4.692-14.297 7.104-22.538 7.192l-.652.029h-84.431v-.024c-8.493.169-15.088-3.546-19.937-10.816-3.904-5.848-6.499-14.044-7.898-24.372l-53.319-80.679c-3.149-4.217-7.429-10.777-10.64-18.062-2.409-5.466-4.234-11.397-4.616-17.22-.451-6.887.506-12.435 2.468-16.773 2.438-5.386 6.31-8.898 11-10.805 4.375-1.78 9.317-2.044 14.299-1.054 5.972 1.188 12.128 4.212 17.377 8.551 4.393 3.63 11.565 9.52 18.424 15.127l6.061 4.952.284-53.02c-3.991 1.48-7.983 3.1-11.977 4.864a10.936 10.936 0 01-6.199 1.81 10.933 10.933 0 01-6.196-1.81c-29.266-12.933-58.454-18.06-87.631-17.874-29.92.189-70.303 5.989-100.736 14.704-1.105.375-2.288.58-3.522.58C4.888 310.614 0 305.726 0 299.698v-237.8c0-6.029 4.888-10.916 10.915-10.916h10.916v234.435c27.576-7.108 65.392-11.653 93.256-11.83 25.738-.162 51.474 3.419 77.24 12.158-16.027-12.993-33.898-22.509-52.946-28.723-24.01-7.835-60.141-10.438-86.723-8.156-6.005.492-11.273-3.974-11.765-9.979a10.608 10.608 0 01.003-1.861zm324.052 103.841c.295 7.593-.147 15.445-.548 22.562-.239 4.226-.46 8.143-.46 11.734a7.143 7.143 0 01-14.283 0c0-3.396.248-7.781.515-12.516 1-17.705 2.336-41.379-10.03-43.721h-11.158c.556 8.456.053 17.402-.399 25.417-.239 4.225-.46 8.142-.46 11.732a7.143 7.143 0 01-14.284 0c0-3.395.248-7.78.516-12.515.999-17.704 2.335-41.381-10.032-43.723h-9.369a7.195 7.195 0 01-1.57-.175l-.325 36.85a7.115 7.115 0 01-14.227-.111l.754-85.89-.022-.565c0-12.428-5.069-20.264-11.544-23.538-2.377-1.202-4.931-1.808-7.454-1.812a16.324 16.324 0 00-7.414 1.796c-6.412 3.259-11.413 11.127-11.413 23.849h-.027l-.76 142.342a7.115 7.115 0 01-14.228-.056l.07-13.121a7.122 7.122 0 01-1.193-.773 1777.083 1777.083 0 01-13.81-11.178 5011.309 5011.309 0 01-18.481-15.182c-3.448-2.851-7.351-4.809-11.016-5.539-2.356-.468-4.517-.416-6.209.272-1.379.561-2.556 1.675-3.355 3.442-1.043 2.306-1.532 5.593-1.241 10.022.257 3.927 1.625 8.238 3.444 12.366 2.692 6.107 6.344 11.688 9.038 15.293.159.214.305.434.437.659l54.239 82.073a7.084 7.084 0 011.135 3.097c1.085 8.936 2.982 15.62 5.781 19.813 2.03 3.043 4.659 4.593 7.941 4.509l.167-.002v-.026h84.431l.591.025c5.292-.08 10.128-1.649 14.509-4.679 4.843-3.348 9.266-8.543 13.271-15.547l1.027-1.747c10.541-18.17 20.77-35.804 21.844-56.749l-.543-24.29a7.204 7.204 0 01-.077-1.046l.073-5.697c.203-17.772.514-44.991-14.267-47.651h-9.372l-.212-.004zm-74.486-109.385c20.719-5.113 46.06-7.293 65.22-5.771V24.253c-48.14-4.545-107.824 5.005-135.596 49.25v191.441a343.885 343.885 0 017.347-4.774l.053-9.929h-.028c0-18.89 8.423-31.079 19.224-36.571a30.51 30.51 0 0113.886-3.302 30.82 30.82 0 0113.871 3.319c6.73 3.403 12.554 9.359 16.023 17.795zm57.363 183.293a5.833 5.833 0 0111.665 0v26.677a5.833 5.833 0 01-11.665 0v-26.677zm-34.477-11.786a5.833 5.833 0 0111.665 0v38.461a5.834 5.834 0 01-11.665 0v-38.461zM198.259 262.846V73.178C172.635 28.033 111.358 16.964 63.924 23.74l-1.225 202.662c25.265-.9 60.166 2.315 83.419 9.901 18.519 6.04 36.056 14.847 52.141 26.543z"/>
        </svg>
    </a>
    <nav class="side-bar__nav">
        <ul>
            <li>
                <a href="../dashboard" class="active__side-bar nav__link"><i class="fa-solid fa-table-cells"></i>Dashboard</a>
            </li>
            <li>
                <a href="/dashboard/users" class="nav__link"><i class="fa-solid fa-user"></i>Users</a>
            </li>
            <li>
                <a href="/dashboard/courses" class="nav__link"><i class="fa-solid fa-file"></i>Courses</a>
            </li>
            <li>
                <a href="../dashboard_lesson" class="nav__link"><i class="fa-solid fa-book"></i>Lesson</a>
            </li>
            <li>
                <a href="../dashboard_chapter" class="nav__link"><i class="fa-solid fa-palette"></i>Chapter</a>
            </li>
            <li>
                <a href="../dashboard_voucher" class="nav__link"><i class="fa-solid fa-ticket"></i>Voucher</a>
            </li>
            <li>
                <a href="#!" class="nav__link"><i class="fa-solid fa-hashtag"></i>Hastags</a>
            </li>
            <li>
                <a href="#!" class="nav__link"><i class="fa-solid fa-right-from-bracket"></i>Log out</a>
            </li>
        </ul>
    </nav>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const navLinkEls = document.querySelectorAll('.nav__link');
            const activeLinkIndex = localStorage.getItem('activeLinkIndex');
            if (activeLinkIndex !== null) {
                navLinkEls.forEach(link => {
                    link.classList.remove('active__side-bar');
                });
                navLinkEls[activeLinkIndex].classList.add('active__side-bar');
            }

            navLinkEls.forEach((navLinkEl, index) => {
                navLinkEl.addEventListener('click', () => {
                    navLinkEls.forEach(link => {
                        link.classList.remove('active__side-bar');
                    });
                    navLinkEl.classList.add('active__side-bar');
                    localStorage.setItem('activeLinkIndex', index);
                });
            });
        });

    </script>
</div>