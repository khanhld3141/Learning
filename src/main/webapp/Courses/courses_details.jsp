<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>

<main>
    <!-- courses feature -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Courses</h1>
                <div class="feature-header__link">
                    <a href="../Home/layout_home.jsp" class="home">Home</a>
                    <span>/</span>
                    <a href="../Courses/courses.jsp" class="courses-details">Courses Details</a>
                </div>
            </div>
        </div>
    </div>

    <!-- courses details -->
    <section class="courses-details">
        <div class="main-content">
            <div class="courses-details__content">
                <!-- courses-details-left -->
                <div class="courses-details__left">
                    <!-- video -->
                    <div class="courses-details__demo-video">
                        <video controls width="100%" height="auto">
                            <source src="../video/demo-video.mp4">
                        </video>
                    </div>
                    <!-- Information courses -->
                    <div class=" courses-details__infor">
                        <h3 class="title">HTML5 for beginners</h3>
                        <span class="hot"><i class="fa-solid fa-bookmark"></i>Hot & new</span>
                        <p class="desc">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius, quae
                            soluta. Praesentium consequatur odio recusandae nostrum pariatur unde</p>
                        <div class="details">
                            <span>By <a href="#">Von wick</a></span>
                            <span>Last update 10 April 2024</span>
                            <span>39 Reviews</span>
                            <span class="ratings">
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                        <a href="#"><i class="fa-regular fa-star" style="color: #FFD43B;"></i></a>
                                    </span>
                        </div>
                    </div>
                    <!-- Overview Courses -->
                    <div class="courses-details__overview">
                        <p class="btn courses-overview__btn">Overview</p>
                        <div class="courses-overview__infor">
                            <!-- this courses include -->
                            <div class="include">
                                <h3 class="heading">This course includes</h3>
                                <ul type="none">
                                    <li><i class="fa-solid fa-hand-point-right"></i> 48.5 hours on-demand video</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> 12 downloadable resources</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Access on mobile and TV</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> 57 articles</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Full lifetime access</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Certificate of Completion</li>
                                </ul>
                            </div>
                            <!-- description -->
                            <div class="description">
                                <h3 class="heading">Description</h3>
                                <p class="desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt
                                    esse architecto delectus at facere maxime totam dolorem eum eligendi ullam
                                    laudantium officia temporibus repellat nostrum neque, debitis atque sint impedit
                                    nemo ipsum! Adipisci dolores ducimus numquam ad cumque possimus? Ex.</p>
                            </div>
                            <!-- requirement -->
                            <div class="requirement">
                                <h3 class="heading">Requirements for this course</h3>
                                <ul type="none">
                                    <li><i class="fa-solid fa-hand-point-right"></i> Lorem, ipsum dolor sit amet
                                        consectetur adipisicing elit.</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Lorem, ipsum dolor sit amet
                                        consectetur adipisicing elit.</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Lorem, ipsum dolor sit amet
                                        consectetur adipisicing elit.</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Lorem, ipsum dolor sit amet
                                        consectetur adipisicing elit.</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Lorem, ipsum dolor sit amet
                                        consectetur adipisicing elit.</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> Lorem, ipsum dolor sit amet
                                        consectetur adipisicing elit.</li>
                                </ul>
                            </div>
                            <!-- courses-objective -->
                            <div class="courses-objective">
                                <h3 class="heading">You will learn form this course</h3>
                                <ul type="none">
                                    <li><i class="fa-solid fa-hand-point-right"></i> HTML is the standard markup
                                        language for creating Web pages.</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> HTML stands for Hyper Text
                                        Markup Language</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> HTML describes the structure of
                                        a Web page</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> HTML consists of a series of
                                        elements</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> HTML elements tell the browser
                                        how to display the content</li>
                                    <li><i class="fa-solid fa-hand-point-right"></i> HTML elements are represented
                                        by tags</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Curriculum -->
                    <div class="curriculum" style="margin-top: 20px">
                        <h1 class="btn curriculum__btn" style="margin-bottom: 0;">Curriculum</h1>
                        <div class="curriculum__content">
                            <div class="accordion" id="accordionCurriculum">
                                <% for (int i = 1; i < 10; i++) {%>
                                <%@include file="../Component/curriculum-chapter-item.jsp"%>
                                <% } %>
                            </div>
                        </div>
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
                <!-- courses-details-right -->
                <div class="courses-details__right">
                    <!-- buy courses -->
                    <div class="widget buy-courses">
                        <p class="price"><strong>$11.39</strong><span>$111.00</span></p>
                        <span class="discount-price"><i class="fa-regular fa-clock"></i>90% off for 23 hours</span>
                        <a href="#" class="btn add-to-card__btn">Add to cart</a>
                        <a href="#" class="btn buy-now__btn">Buy now</a>
                    </div>
                    <!-- instractors -->
                    <div class="widget instractors">
                        <figure>
                            <img src="../img/Testimonial/avatar3.jpeg" alt="avatar" class="instractors__avatar">
                        </figure>
                        <h4>Lisa Sordan</h4>
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
                            <% for (int i = 1; i <= 8; i++) {%>
                                <li><a href="#">App Design <span>(5)</span></a></li>
                            <% } %>
                        </ul>
                    </div>
                    <!-- recent-courses -->
                    <div class="widget recent-courses">
                        <h3 class="widget__title recent-courses__title">Recent Courses</h3>
                        <ul>
                            <% for (int i = 1; i <= 3; i++) {%>
                            <%@include file="../Component/recent-courses__item.jsp"%>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
    </section>
</main>
<%@include file="../Component/footer.jsp"%>