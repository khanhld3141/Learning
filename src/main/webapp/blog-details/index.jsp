<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>
<!-- main -->
<main>
    <!-- feature header -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Blog Details</h1>
                <div class="feature-header__link">
                    <a href="../Home/index.jsp" class="home">Home</a>
                    <span>/</span>
                    <a href="../blog-details" class="blog-details">Blog Details</a>
                </div>
            </div>
        </div>
    </div>
    <div class="blog-details">
        <div class="main-content">
            <div class="blog-details__content">
                <!-- BLOG-DETAILS LEFT -->
                <div class="blog-details__left">
                    <div class="blog-details__single-post">
                        <figure class="single-post__img">
                            <img src="../img/slide-courses/slide4.jpg" alt="picture post">
                        </figure>
                        <div class=" single-post__content">
                            <div class="single-post__meta-tags">
                                <a href="#" class="post-meta"><i class="fa-regular fa-clock"></i>13 April 2024</a>
                                <a href="#" class="post-meta"><i class="fa-regular fa-user"></i>Wailter White</a>
                                <a href="#" class="post-meta"><i class="fa-solid fa-cube"></i>Women Fashion</a>
                                <a href="#" class="post-meta"><i class="fa-regular fa-comment"></i>2 Comments</a>
                            </div>
                            <h3>Sed ut perspiciatis unde omnis iste natus error.</h3>
                            <p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                                laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
                                architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
                                voluptas
                                sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui
                                ratione
                                voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor
                                sit
                                amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt
                            </p>
                            <h6>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Unde, quasi.</h6>
                            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quod at sit recusandae
                                incidunt, pariatur quo provident ullam, iste, dolorum maiores laborum sunt soluta.
                                Fugiat assumenda, nemo dolores, iusto pariatur corporis quis ullam harum voluptate
                                porro
                                officiis aliquam quas explicabo, excepturi reprehenderit illum dicta sapiente vel
                                voluptas quos nobis. Nam, tempore?</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias similique,
                                consequuntur
                                incidunt at repellendus ratione totam excepturi iste. Similique ipsum numquam
                                recusandae, eligendi maiores temporibus officia harum labore deleniti quasi.</p>
                        </div>
                        <!--  comment-->
                        <div class="comment">
                            <h3 class="title">Comments</h3>
                            <% for(int i = 0; i < 3; i++) { %>
                            <%@include file="../Component/comment_item.jsp"%>
                            <% } %>
                        </div>
                        <!-- form comment -->
                        <%@include file="../Component/comment_form.jsp"%>
                    </div>
                </div>
                <!-- BLOG DETAILS RIGHT -->
                <div class="blog-details__right">
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