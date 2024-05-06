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

                <%@include file="../Component/card-courses.jsp"%>
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