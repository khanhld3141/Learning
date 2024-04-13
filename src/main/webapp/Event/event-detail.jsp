
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>


<main>
    <%--ảnh đầu trang--%>
    <jsp:include page="../Component/page-feature.jsp">
        <jsp:param name="head" value="Events Details"/>
        <jsp:param name="span" value="Events Details"/>
    </jsp:include>

    <div class="main-content">
        <section class="event-details">
            <div class="container">
                <div class="row">
                    <div class="col-1">
                        <div class="image">
                            <img src="../img/event-img/course-preview.jpg" alt="Error">
                        </div>
                        <div class="event-item">

                                <div class="tag">
                                    <span class="time">
                                        <i class="fa-regular fa-clock"></i>
                                        2PM TO 5PM
                                    </span>
                                    <span class="date">
                                        <i class="fa-regular fa-calendar"></i>
                                        19 SEP 2024
                                    </span>
                                </div>
                                <h3>Consectetur adipisicing elit.</h3>
                                <p>
                                    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Mollitia eveniet nulla quo culpa nihil hic eius, distinctio, porro facere, dolor aliquid eos? Harum laborum itaque ab voluptatum totam officiis, porro aperiam, molestias repellat amet error id voluptates, expedita similique corrupti dignissimos earum voluptate quaerat officia. Tempore eaque magnam repudiandae dicta!

                                    Recusandae earum ea, architecto corporis voluptates magnam rerum alias repellat quia vel animi dolorum repudiandae? Voluptatem voluptas tempora, ipsa est magnam officia.

                                </p>

                        </div>
                    </div>

                    <div class="col-2">
                        <div class="book">
                            <div class="widget buy-course">
                                <h2>Book now</h2>
                                <p>Only 30 Seats available now</p>
                                    <div class="button">
                                        <a href="#!">BOOK NOW</a>
                                    </div>
                            </div>
                            <div class="widget categories">
                                <h3>Event Info</h3>
                                <ul>
                                    <li><a href="#!">Date <span>20 SEP, 2024</span></a></li>
                                    <li><a href="#!">Total Slots <span>100</span></a></li>
                                    <li><a href="#!">Teacher <span>Vo Duc Hoang</span></a></li>
                                </ul>
                            </div>
                            <div class="widget contact-info">
                                <h3>Contact Info</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure quod accusamus est obcaecati eum culpa in explicabo cupiditate animi corporis.</p>
                                <h6>Location Info</h6>
                                <span>Address line 1, Avg Centre Point. Level 5, New Yourk City - USA</span>
                                <div class="num">
                                    <h6>Hotline Numbers</h6>
                                    <a href="">+123 4567 8912</a>
                                    <a href="">+321 7654 2198</a>
                                </div>
                                <div class="email">
                                    <h6>Email Us</h6>
                                    <a href="">youremail@domain.com</a>
                                    <a href="">help@example.com</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>




<%@include file="../Component/footer.jsp"%>
