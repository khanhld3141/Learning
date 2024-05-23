<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>

<main>
    <style>
        .nav-pills .nav-link.active{
            text-align: center;
            font-size: 16px;
            background: linear-gradient(to right, #ef3e0f, #ffb800);
            color: #fff;
            border-radius: 0;
            padding: 20px;
        }
        .nav-pills .nav-link{
            text-align: center;
            background-color: #ccc6c6;
            font-size: 16px;
            color: #000;
            border-radius: 0;
            padding: 20px;
        }
    </style>
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/manage-chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/update-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
    <!-- courses feature -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Courses</h1>
                <div class="feature-header__link">
                    <a href="../Home/index.jsp" class="home">Home</a>
                    <span>/</span>
                    <a href="../Courses/index.jsp" class="courses-details">Courses Details</a>
                </div>
            </div>
        </div>
    </div>

    <!-- courses details -->
    <section class="courses-details">
        <div class="main-content">
            <%
                if (request.getAttribute("course") != null) {
                    Course course = (Course) request.getAttribute("course");
                    List<CourseComment> courseComment = (List<CourseComment>) request.getAttribute("comments");
            %>
            <div class="courses-details__content">
                <!-- courses-details-left -->


                <div class="courses-details__left">
                    <!-- video -->
                    <div class="courses-details__demo-video">
                        <img style="width: 100%;object-fit: cover" src="/images/<%=course.getImage()%>">
                    </div>
                    <!-- Information courses -->
                    <div class=" courses-details__infor">
                        <h3 class="title"><%=course.getName()%>
                        </h3>
                        <p class="desc"><%=course.getIntroduce()%>
                        </p>
                        <div class="details">
                            <span>By <a href="#">Von wick</a></span>
                            <span>Last update <%=course.getCreatedAt().getDate()%> /
                                <%=course.getCreatedAt().getMonth()%> /
                                <%=course.getCreatedAt().getYear() + 1900%></span>
                            <span><%=courseComment.size()%> Reviews</span>
                            <span class="ratings">
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                    </span>
                        </div>
                    </div>
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item" style="width: 50%">
                            <a class="nav-link active" data-bs-toggle="pill" href="#overview">Overview</a>
                        </li>
                        <li class="nav-item" style="width: 50%">
                            <a class="nav-link" data-bs-toggle="pill" href="#curriculum">Curriculum</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="overview" class="container tab-pane active" style="padding: 0"><br>
                            <div class="courses-details__overview">
<%--                                <p class="btn courses-overview__btn">Overview</p>--%>
                                <div class="courses-overview__infor">
                                    <%=course.getOverview()%>
                                </div>
                            </div>
                        </div>
                        <div id="curriculum" class="container tab-pane fade"><br>
                            <div class="curriculum" style="margin-top: 20px">
<%--                                <h1 class="btn curriculum__btn" style="margin-bottom: 0;">Curriculum</h1>--%>
                                <div class="curriculum__content">
                                    <div class="accordion" id="accordionCurriculum">
                                        <%@include file="../Component/curriculum-chapter-item.jsp" %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Overview Courses -->
<%--                    <div class="courses-details__overview">--%>
<%--                        <p class="btn courses-overview__btn">Overview</p>--%>
<%--                        <div class="courses-overview__infor">--%>
<%--                            <%=course.getOverview()%>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!-- Curriculum -->
<%--                    <div class="curriculum" style="margin-top: 20px">--%>
<%--                        <h1 class="btn curriculum__btn" style="margin-bottom: 0;">Curriculum</h1>--%>
<%--                        <div class="curriculum__content">--%>
<%--                            <div class="accordion" id="accordionCurriculum">--%>
<%--                                <%@include file="../Component/curriculum-chapter-item.jsp" %>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!--  comment-->
                    <div class="comment">
                        <h3 class="title">Comments</h3>
                        <%@include file="../Component/comment_course.jsp" %>
                    </div>
                    <!-- form comment -->
                    <div class="comment-form">
                        <h4 class="comment-title">Leave a comment</h4>
                        <form action="/comment-course" method="post">
                            <textarea id="comment" placeholder="Write Comments" name="comment"></textarea>
                            <input hidden="hidden" name="courseid" id="idcourse" value="<%=course.getId()%>">
                            <button id="btnComment" class="btn submit-comment__btn">SUBMIT</button>
                        </form>
                    </div>
                </div>

                <!-- courses-details-right -->
                <div class="courses-details__right">
                    <!-- buy courses -->
                    <div class="widget buy-courses">
                        <p class="price"><strong>$<%=course.getPrice()%>
                        </strong><span>$111.00</span></p>
                        <span class="discount-price"><i class="fa-regular fa-clock"></i>90% off for 23 hours</span>


                        <%
                            if (session.getAttribute("user") != null) {
                                if (request.getAttribute("usercourse") != null) {
                                    List<UserCourse> userCourses = (List<UserCourse>) request.getAttribute("usercourse");
                                    boolean check = false;
                                    for (UserCourse userCourse : userCourses) {
                                        if (userCourse.getCourseId() == course.getId()) {
                                            check = true;
                                            break;
                                        }
                                    }
                                    if (check) {

                        %>
                        <span style="color: green"><a style="background: #1ed085;color: #FFFFFF" href="/learning?courseid=<%=course.getId()%>"
                                                       class="btn buy-now__btn">LEARN NOW</a></span>
                        <%
                        } else {
                        %>
                        <a href="/learning?courseid=<%=course.getId()%>" class="btn buy-now__btn">BUY NOW</a>

                        <%
                                }
                            }

                        } else {
                        %>
                        <a href="/learning?courseid=<%=course.getId()%>" class="btn buy-now__btn">BUY NOW</a>
                        <%
                            }
                        %>


                    </div>
                    <!-- instractors -->
                    <div class="widget instractors">
                        <figure>
                            <img src="/images/<%=course.getTeacher().getAvatar()%>" alt="avatar"
                                 class="instractors__avatar">
                        </figure>
                        <h4><%=course.getTeacher().getName()%>
                        </h4>
                        <span>Web designer</span>
                        <div class="socials">
                            <a href="#" class="facebook"><i class="fa-brands fa-facebook-f"></i></a>
                            <a href="#" class="twitter"><i class="fa-brands fa-twitter"
                                                           style="color: #74C0FC;"></i></a>
                            <a href="#" class="linkedin"><i class="fa-brands fa-linkedin-in"></i></a>
                            <a href="#" class="youtube"><i class="fa-brands fa-youtube"
                                                           style="color: #e32416;"></i></a>
                        </div>
                    </div>
                    <!-- list categories -->
                    <div class="widget list-categories">
                        <h3 class="widget__title list-categories__title">Categories</h3>
                        <ul>
                            <%
                                if (request.getAttribute("categories") != null) {
                                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                                    for (Category category : categories) {
                            %>
                            <li><a href="/courses?category=<%=category.getId()%>"><%=category.getName()%>
                                <span>(<%=category.getTotalCourse()%>)</span></a>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <!-- recent-courses -->
                    <div class="widget recent-courses">
                        <h3 class="widget__title recent-courses__title">Recent Courses</h3>
                        <ul>
                            <%@include file="../Component/recent-courses__item.jsp" %>
                        </ul>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </section>
    <script>
        $(document).ready(function () {
            $('.owl-carousel').owlCarousel({
                loop: true,
                nav: true,
                margin: 30,
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 2
                    },
                    992: {
                        items: 3
                    }
                }
            })
        });
    </script>

    <div class="slide-courses">

        <div class="main-content">
            <h1 class="title title__popular-courses">Related Courses</h1>
            <div class="owl-carousel owl-theme">
                <%@include file="../Component/card-courses.jsp" %>
            </div>
        </div>
    </div>
</main>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script>--%>
<%--    let text=document.querySelector("#comment")--%>
<%--    let btnComment=document.querySelector("#btnComment")--%>
<%--    let idCourse=document.querySelector("#idcourse")--%>

<%--    btnComment.addEventListener('click',()=>{--%>
<%--        let formData = new FormData();--%>
<%--        formData.append('courseid', idCourse.value);--%>
<%--        formData.append('comment',text.value);--%>
<%--        $.ajax({--%>
<%--            url: '/post-comment',--%>
<%--            type: 'POST',--%>
<%--            data: formData,--%>
<%--            processData: false,--%>
<%--            contentType: false,--%>
<%--            success:()=>{--%>
<%--                contentModal.innerHTML=''--%>
<%--                showComment();--%>
<%--            }--%>
<%--        })--%>

<%--    })--%>
<%--</script>--%>
<%@include file="../Component/footer.jsp" %>