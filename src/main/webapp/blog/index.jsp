<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>
    <main>
        <!-- feature header -->
        <div class="feature-header">
            <div class="main-content">
                <div class="feature-header__text-center">
                    <h1 class="title feature-header__title">Blog</h1>
                    <div class="feature-header__link">
                        <a href="../Home/index.jsp" class="home">Home</a>
                        <span>/</span>
                        <a href="index.jsp" class="blog">Blog</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- blog-posts -->
        <div class="blog-posts">
            <div class="main-content">
                <div class="blog-posts__content">
                    <div class="blog-posts__left">
                        <!-- list card blog -->
                        <div class="list-item-courses">
                            <% for(int i = 1; i <= 6; i++) {%>
                            <%@include file="../Component/card-blog.jsp"%>
                            <% } %>
                        </div>
                        .<ul class="pagination justify-content-start">
                        <li class=" page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                    </div>
                    <div class="blog-posts__right">
                        <!-- search form -->
                        <div class="widget widget-search">
                            <form action="#">
                                <input type="text" name="s" placeholder="Search..." required="">
                                <a href="#!"><i class="fa-solid fa-magnifying-glass"></i></a>
                            </form>
                        </div>
                        <!-- list categories -->
                        <div class="widget list-categories">
                            <h3 class="widget__title list-categories__title">Categories</h3>
                            <ul>
                                <% for (int i = 1; i <= 8; i++) {%>
                                <li><a href="#">App Design <span>(5)</span></a></li>
                                <% } %>
                            </ul>
                        </div>
                        <!-- recent-posts -->
                        <div class="widget recent-posts">
                            <h3 class="widget__title">recent posts</h3>
                            <ul>
                                <% for (int i = 1; i <= 3; i++) {%>
                                    <%@include file="../Component/recent-posts__item.jsp"%>
                                <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</main>
<%@include file="../Component/footer.jsp"%>