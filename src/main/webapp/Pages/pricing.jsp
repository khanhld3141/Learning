
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>


<main>
    <%--ảnh đầu trang--%>
    <jsp:include page="../Component/page-feature.jsp">
        <jsp:param name="head" value="Pricing"/>
        <jsp:param name="span" value="Pricing"/>
    </jsp:include>

    <section class="pricing">
        <div class="main-content">
            <div class="row1">
                <div class="head">
                    <span>PRICING PLAN</span>
                    <h3 class="title">Take Plan According To Your Need</h3>
                </div>
            </div>
            <div class="row2">

                    <div class="col standard">
                        <div class="pricing-box">
                            <div class="p-head">
                                <h4>Standard</h4>
                                <p>30$
                                    <span>/Month</span>
                                </p>
                                <span class="access">Access 5 courses</span>
                            </div>
                            <div class="p-body">
                                <ul>
                                    <li><i class="fa-solid fa-check"></i>Certificate</li>
                                    <li><i class="fa-solid fa-check"></i>Rewatch Courses</li>
                                    <li><i class="fa-solid fa-x"></i>Conference</li>
                                    <li><i class="fa-solid fa-check"></i>Teacher Help</li>
                                    <li><i class="fa-solid fa-check"></i>Quizzes</li>
                                    <li><i class="fa-solid fa-x"></i>Data Storage</li>
                                    <li><i class="fa-solid fa-x"></i>Free Call</li>
                                </ul>
                                <a href="#!" class="button-buy">BUY PLAN</a>
                            </div>
                        </div>
                    </div>


                    <div class="col premium">
                        <div class="pricing-box">
                            <div class="p-head">
                                <h4>Premium</h4>
                                <p>40$
                                    <span>/Month</span>
                                </p>
                                <span class="access">Acess 10 courses</span>
                            </div>
                            <div class="p-body">
                                <ul>
                                    <li><i class="fa-solid fa-check"></i>Certificate</li>
                                    <li><i class="fa-solid fa-check"></i>Rewatch Courses</li>
                                    <li><i class="fa-solid fa-x"></i>Conference</li>
                                    <li><i class="fa-solid fa-check"></i>Teacher Help</li>
                                    <li><i class="fa-solid fa-check"></i>Quizzes</li>
                                    <li><i class="fa-solid fa-x"></i>Data Storage</li>
                                    <li><i class="fa-solid fa-check"></i>Free Call</li>
                                </ul>
                                <a href="#!" class="button-buy">BUY PLAN</a>
                            </div>
                        </div>
                    </div>


                    <div class="col business">
                        <div class="pricing-box">
                            <div class="p-head">
                                <h4>Business</h4>
                                <p>60$
                                    <span>/Month</span>
                                </p>
                                <span class="access">Access 15 courses</span>
                            </div>
                            <div class="p-body">
                                <ul>
                                    <li><i class="fa-solid fa-check"></i>Certificate</li>
                                    <li><i class="fa-solid fa-check"></i>Rewatch Courses</li>
                                    <li><i class="fa-solid fa-check"></i>Conference</li>
                                    <li><i class="fa-solid fa-check"></i>Teacher Help</li>
                                    <li><i class="fa-solid fa-check"></i>Quizzes</li>
                                    <li><i class="fa-solid fa-check"></i>Data Storage</li>
                                    <li><i class="fa-solid fa-x"></i>Free Call</li>
                                </ul>
                                <a href="#!" class="button-buy">BUY PLAN</a>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </section>



</main>

<%@include file="../Component/footer.jsp"%>
