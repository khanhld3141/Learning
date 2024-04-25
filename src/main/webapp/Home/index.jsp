<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <!-- slide + input-->
    <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <!-- thêm các item vào -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../img/hero-img/slide1.jpg" class="item__pic" alt="Slide1">
                <!-- caption -->
                <div class="carousel__layout"></div>
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="carousel-heading">
                        <p>EDUCATE!</p>
                        <p>SMART IS GREAT</p>
                    </h2>
                    <div class="carousel__search-form">
                        <select name="categories" id="categories1" class="categories">
                            <option value="value02" selected>All Categories</option>
                            <%
                                if (request.getAttribute(("categories")) != null) {
                                    List<Category> categories = (List<Category>) request.getAttribute(("categories"));
                                    for (Category c : categories) {
                            %>
                            <option value="<%=c.getId()%>"><%=c.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <input name="search" type="text" placeholder="Enter a Subject" class="enter-subject">
                        <button type="submit" class="button-search"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../img/hero-img/slide2.jpg" class="item__pic" alt="Slide2">
                <div class="carousel__layout"></div>
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="carousel-heading">
                        <p>EDUCATE!</p>
                        <p>SMART IS GREAT</p>
                    </h2>
                    <div class="carousel__search-form">
                        <select name="categories" id="categories2" class="categories">
                            <option value="value02" selected>All Categories</option>
                            <%
                                if (request.getAttribute(("categories")) != null) {
                                    List<Category> categories = (List<Category>) request.getAttribute(("categories"));
                                    for (Category c : categories) {
                            %>
                            <option value="<%=c.getId()%>"><%=c.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <input type="text" placeholder="Enter a Subject" class="enter-subject">
                        <button type="submit" class="button-search"></button>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../img/hero-img/slide1.jpg" class="item__pic" alt="Slide3">
                <div class="carousel__layout"></div>
                <div class="carousel-caption d-none d-md-block">
                    <h2 class="carousel-heading">
                        <p>EDUCATE!</p>
                        <p>SMART IS GREAT</p>
                    </h2>
                    <div class="carousel__search-form">
                        <select name="categories" id="categories3" class="categories">
                            <option value="value02" selected>All Categories</option>
                            <%
                                if (request.getAttribute(("categories")) != null) {
                                    List<Category> categories = (List<Category>) request.getAttribute(("categories"));
                                    for (Category c : categories) {
                            %>
                            <option value="<%=c.getId()%>"><%=c.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <input type="text" placeholder="Enter a Subject" class="enter-subject">
                        <button type="submit" class="button-search"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- feature box -->
    <div class="feature-box">
        <div class="main-content">
            <!-- item 1 -->
            <div class="feature-box__content">
                <div class="feature-box__item">
                    <div class="item__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" class="item__icon--logo">
                            <path fill="currentColor"
                                  d="M0 336c0 79.5 64.5 144 144 144H512c70.7 0 128-57.3 128-128c0-61.9-44-113.6-102.4-125.4c4.1-10.7 6.4-22.4 6.4-34.6c0-53-43-96-96-96c-19.7 0-38.1 6-53.3 16.2C367 64.2 315.3 32 256 32C167.6 32 96 103.6 96 192c0 2.7 .1 5.4 .2 8.1C40.2 219.8 0 273.2 0 336z"/>
                        </svg>
                    </div>
                    <div class="item__infor">
                        <p><strong>100,000 online courses</strong></p>
                        <p>Explore a variety of fresh topics
                        </p>
                    </div>
                </div>
                <!-- item 2 -->
                <div class="feature-box__item">
                    <div class="item__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="item__icon--logo">
                            <path fill="currentColor"
                                  d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/>
                        </svg>
                    </div>
                    <div class="item__infor">
                        <p><strong>Expert instruction</strong></p>
                        <p>Find the right instructor for you</p>
                    </div>
                </div>
                <!-- item 3 -->
                <div class="feature-box__item">
                    <div class="item__icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="item__icon--logo">
                            <path fill="currentColor"
                                  d="M256 0a256 256 0 1 1 0 512A256 256 0 1 1 256 0zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/>
                        </svg>
                    </div>
                    <div class="item__infor">
                        <p><strong>Lifetime access</strong></p>
                        <p>Learn on your schedule</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- category -->
    <div class="category">
        <div class="main-content">
            <div class="category__header">
                <p class="tagline blog__tag-line">CATEGORIES</p>
                <h1 class="title blog__title">Every Single Update From Our Blog Page</h1>
            </div>
            <div class="category__list">
                <%
                    if (request.getAttribute(("categories")) != null) {
                        List<Category> categories = (List<Category>) request.getAttribute(("categories"));
                        for (Category c : categories) {
                %>
                <a href="#!" class="category__card">
                    <div class="card__logo">
                        <img src="<%=c.getImage()%>"/>
                    </div>
                    <div class="card__name"><%=c.getName()%></div>
                </a>
                <%
                        }
                    }
                %>


            </div>
        </div>
    </div>

    <!-- discount trial -->
    <div class="discount-trial">
        <div class="main-content">
            <div class="discount-trial__content">
                <section class="discount__infor">
                    <h2 class="discount__title">50% DISCOUNT VOUCHER</h2>
                    <h3 class="discount__desc">ON YOUR NEXT ENROLL</h3>
                    <h4 class="discount__coupon">Use coupon code <strong>PBL3X2024</strong></h4>
                </section>
                <form action="" class="form__free-trial">
                    <div class="layout__free-trial"></div>
                    <div class="form-free-trial__content">
                        <h3 class="form-title">15 day free trial</h3>
                        <input type="text" placeholder="Your Name">
                        <input type="email" placeholder="Your Email">
                        <input type="tel" placeholder="Your Phone">
                        <button type="submit" class="btn btn--submit__trial">Get your free trial</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- slide courses -->

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
            <h1 class="title title__popular-courses">Popular Courses</h1>
            <div class="owl-carousel owl-theme">
                <!-- item 1 -->
                <% for (int i = 0; i < 6; i++) { %>
                <%@ include file="../Component/card-courses.jsp" %>
                <% } %>
            </div>
        </div>
    </div>

    <!-- high-light-web -->
    <div class="high-light">
        <div class="main-content">
            <div class="list-high-light">
                <div class="high-light__item">
                    <span>291</span>
                    <p>Amazing Courses</p>
                </div>
                <div class="high-light__item">
                    <span>38</span>
                    <p>talented instructors</p>
                </div>
                <div class="high-light__item">
                    <span>3940</span>
                    <p>Skilled Students</p>
                </div>
                <div class="high-light__item">
                    <span>14</span>
                    <p>categories</p>
                </div>
            </div>
        </div>
    </div>

    <!-----Slide Blog---->
    <div class="blog">
        <div class="main-content">
            <p class="tagline blog__tag-line">WHAT'S NEW</p>
            <h1 class="title blog__title">Every Single Update From Our Blog Page</h1>
            <div class="owl-carousel owl-theme">
                <!-- items -->
                <%
                    for (int i = 1; i <= 6; i++) { %>
                <%@ include file="../Component/card-blog.jsp" %>
                <% }%>
            </div>
        </div>
    </div>

    <!-- Testimonial-->
    <div class="testimonial">
        <div class="main-content">
            <div class="testimonial-top">
                <p class="tagline testimonial__tag-line">TESTIMONIAL</p>
                <h2 class="title testimonial__title">What Our Users Say About Us</h2>
            </div>
            <div class="testimonial__box">
                <div id="testimonial-carousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <!-- item 1 -->
                            <div class="testimonial__item">
                                <p class="testimonial__word">Lorem ipsum dolor sit amet, consectetur adipiscing
                                    elit, sed do eiusmod tempor incididunt
                                    ut labore eco dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                                    Risus
                                    commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                <div class="testimonial__user">
                                    <img src="../img/Testimonial/avatar3.jpeg" class="avatar-small circle" alt="">
                                    <strong>Khanh Dang</strong>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <!-- item 1 -->
                            <div class="testimonial__item">
                                <p class="testimonial__word">Lorem ipsum dolor sit amet, consectetur adipiscing
                                    elit, sed do eiusmod tempor incididunt
                                    ut labore eco dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                                    Risus
                                    commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                <div class="testimonial__user">
                                    <img src="../img/Testimonial/avatar3.jpeg" class="avatar-small circle" alt="">
                                    <strong>Khanh Dang</strong>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <!-- item 1 -->
                            <div class="testimonial__item">
                                <p class="testimonial__word">Lorem ipsum dolor sit amet, consectetur adipiscing
                                    elit, sed do eiusmod tempor incididunt
                                    ut labore eco dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                                    Risus
                                    commodo viverra maecenas accumsan lacus vel facilisis.</p>
                                <div class="testimonial__user">
                                    <img src="../img/Testimonial/avatar3.jpeg" class="avatar-small circle" alt="">
                                    <strong>Khanh Dang</strong>
                                </div>
                            </div>
                        </div>

                        <!-- thêm điều hướng và 2 nút điều hướng -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#testimonial-carousel"
                                data-bs-slide="prev" style=" background-color: #FFD43B; width: 40px; height: 40px;
                        opacity: 1; display: block; top: 60%">
                            <span class=" carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#testimonial-carousel"
                                data-bs-slide="next" style=" background-color: #FFD43B; width: 40px; height: 40px;
                                opacity: 1; display: block; top: 60%">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Newsletter-->
    <div class="newsletter">
        <div class="main-content">
            <div class="newsletter__content">
                <h3>Newsletter Subscription</h3>
                <p>Get updated with latest news</p>
                <form class="newsletter__form" action="#">
                    <input type="text" placeholder="Enter your Email">
                    <button type="submit"><i class="fa-regular fa-paper-plane"></i>Subscribe</button>
                </form>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
