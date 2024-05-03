<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>

<main>
    <!-- courses feature -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Courses</h1>
                <div class="feature-header__link">
                    <a href="../Home/index.jsp" class="home">Home</a>
                    <span>/</span>
                    <a href="index.jsp" class="courses">Courses</a>
                </div>
            </div>
        </div>
    </div>

    <!-- find-courses -->
    <div class="find-courses">
        <div class="main-content">
            <form action="" class="courses__search-form">
                <input type="text" placeholder="Enter a Subject">
                <button type="submit">Find now</button>
            </form>
        </div>
    </div>

    <!-- list-courses -->
    <div class="list-courses">
        <div class="main-content">
            <div class="list-courses__content">
                <%
                    if (request.getAttribute("courses") != null) {
                        List<Course> courses = (List<Course>) request.getAttribute("courses");
                        for (Course c : courses) {



                %>
                <div class="item__card-courses">
                    <div class="card-courses" id="card-courses">
                        <div class="card-courses__thumb">
                            <img src="/images/<%=c.getImage()%>" alt="" class="card-courses__img">
                            <p class="price__courses"><%=c.getPrice()%>$</p>
                        </div>

                        <div class="card-courses__content">
                            <a href="/courses?id=<%=c.getId()%>" class="card-courses__heading"><%=c.getName()%></a>
                            <h3 class="card-courses__desc"><%=c.getIntroduce()%></h3>
                            <div class="card-courses__enroll">
                                <div class="enroll__left">
                                    <p class="total-student"><i class="fa-regular fa-user"></i> <%=c.getStudents().size()%>
                                        Students</p>
                                    <div class="total-star">
                                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                                    </div>
                                </div>
                                <button class="btn btn--enroll">ENROLL NOW</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                    }
                %>
            </div>
            <!-- pagination -->
            <ul class="pagination justify-content-start">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>