<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page import="model.Category" %>
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
            <form action="/courses" method="get" class="courses__search-form">
                <input name="query" type="text" placeholder="Enter a Subject">
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
                <li id="prev" onclick="previousPage()"
                    class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li id="next" onclick="nextPage()" class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>



</main>
<script>
    function previousPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousPage = currentPage - 1;
        if (previousPage >= 1) {
            window.location.href = "/courses?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/courses?page=" + nextPage;
    }
    window.onload = function() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousButton = document.getElementById("prev");
        if (currentPage == 1) {
            previousButton.disabled = true;
        } else {
            previousButton.disabled = false;
        }
    };
</script>
<%@include file="../Component/footer.jsp" %>