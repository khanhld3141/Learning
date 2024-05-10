<%@ page import="model.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Chapter" %>
<%@ page import="model.Lession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>

<body>
<link rel="stylesheet" href="../assets/css/BuyCourse/BuyCourse.css">
<div class="buy-course">
    <%
        if (request.getAttribute("course") != null) {
            Course c = (Course) request.getAttribute("course");
    %>
    <div class="buy-course-content">
        <div class="side-bar">
            <div class="course-name-box">
                <h2>Course's name:</h2>
                <span class="course-name"><%=c.getName()%></span>
            </div>
            <div class="course-id-box">
                <h2>Course's ID:</h2>
                <span class="course-id"><%=c.getId()%></span>
            </div>
            <div class="course-id-box">
                <h2>Category:</h2>
                <span class="course-id"><%=c.getCategory().getName()%></span>
            </div>
            <hr class="buy-course-divider">

            <div class="buy-course-detail">
                <div class="buy-course-detail-subtitle">
                    <h2>Payment details:</h2>
                </div>
                <div class="buy-course-detail-wrapper">
                    <form action="/buy" method="post" style="width: 100%;">
                        <input name="courseid" value="<%=c.getId()%>" hidden="hidden">
                        <div class="voucher-input" style="margin-bottom: 16px;">
                            <input type="text" name="voucher" id="" placeholder="Type voucher's ID here">
                        </div>
                        <div class="price-box">
                            <span class="price-desc">Price:</span>
                            <span class="price-detail">$<%=c.getPrice()%></span>
                        </div>
                        <hr class="buy-course-divider">
                        <div class="price-box price-reduced">
                            <span class="price-desc">Reduced price:</span>
                            <span class="price-detail">$0</span>
                        </div>
                        <hr class="buy-course-divider">
                        <div class="price-box total-price-box">
                            <span class="price-desc">Total price:</span>
                            <span class="price-detail">$<%=c.getPrice()%></span>
                        </div>
                        <input class="btn" value="Buy" type="submit" style="margin: 10px 0">
                    </form>
                </div>


                <!-- Button trigger modal -->
                <%--                    <button type="button" class="btn btn-primary btnBC btn-buy-course" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
                <%--                        BUY COURSE--%>
                <%--                    </button>--%>
                <%--                    <a class="btn btn-primary btnBC btn-buy-course" data-bs-toggle="modal" href="#exampleModalToggle" role="button" style="line-height: 34px;">BUY COURSE</a>--%>
                <!-- Modal -->
                <%--                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
                <%--                        <div class="modal-dialog">--%>
                <%--                            <div class="modal-content">--%>
                <%--                                <div class="modal-header">--%>
                <%--                                    <h5 class="modal-title" id="exampleModalLabel" style="color: #000; font-weight: 500;">ATTENTION !!!</h5>--%>
                <%--                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                <%--                                </div>--%>
                <%--                                <div class="modal-body">--%>
                <%--                                    <h3 style="color:#000; font-weight: 400; font-size:14px">Are you sure to buy this course?</h3>--%>
                <%--                                </div>--%>
                <%--                                <div class="modal-footer">--%>
                <%--                                    <button type="button" class=" btn-secondary  btnModalBuyCourse btnModalBuyCourse__Close" data-bs-dismiss="modal">Close</button>--%>
                <%--                                    <button type="button" class=" btn-primary  btnModalBuyCourse btnModalBuyCourse__Buy">Buy</button>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
            </div>
        </div>
        <div class="buy-course-desc">
            <div class="will-learn">
                <h1 class="will-learn__title">
                    What will you learn?
                </h1>
                <ul class="will-learn-list">
                    <%
                        List<Chapter> chapters = c.getChapters();
                        for (Chapter ch : chapters) {
                    %>
                    <ul class="will-learn-list-review"><%= ch.getName()%>
                        <%
                            List<Lession> lessions = ch.getLessions();
                            for (Lession l : lessions) {

                        %>
                        <li><%=l.getName()%>
                        </li>
                        <%}%>
                    </ul>
                    <%}%>
                </ul>
            </div>
            <div class="FAQ">
                <h1>FAQ</h1>
                <div class="FAQ-section">
                    <div class="suitable">
                        <h2>Suitable person</h2>
                        <h3>Is this course suitable for complete beginners?</h3>
                        <p>This course is VERY suitable for people who are completely unfamiliar with HTML and CSS
                            (Academy's design focuses on newbies). You only need to know how to use a computer at a
                            basic level to participate in the class.</p>
                        <h3>If I already know HTML and CSS, is this course still suitable?</h3>
                        <p>Even if you already know HTML and CSS, this course is still VERY necessary for you. The
                            course covers a lot of in-depth knowledge that no other course normally covers (you can try
                            it out and see the lesson outline).Even if you already know HTML and CSS, this course is
                            still VERY necessary for you. The course covers a lot of in-depth knowledge that no other
                            course normally covers (you can try it out and see the lesson outline).</p>
                        <p>Furthermore, this course has many types of interesting and engaging lessons such as:
                            challenging exercises, bonus games to support learning, independent challenges with many
                            students participating, etc.</p>
                    </div>
                </div>
                <div class="FAQ-section">
                    <div class="benenfit">
                        <h2>Benefits</h2>
                        <h3>How many times can I watch the video?</h3>
                        <p>With the videos you have learned, you can freely watch any video you want, with no limit on
                            the number of times you watch the video. Academy even encourages you to watch as much as
                            possible to better grasp your knowledge.</p>
                        <h3>When can I study?</h3>
                        <p>The lecture has been pre-designed, with detailed and complete content. As long as you have
                            the Internet, you can study anytime, anywhere. You can always take the initiative in time
                            and location without worrying about anything.</p>
                    </div>
                </div>
                <div class="FAQ-section">
                    <div class="application">
                        <h2>Practical application</h2>
                        <h3>Can I apply immediately after studying?</h3>
                        <p>Sure! Academy always focuses on students and goes hand in hand with practice. Therefore,
                            after each video or text lesson, you will do a lot of exercises to condense your knowledge,
                            master the syntax, and even do a new coding challenge.</p>
                        <p>Most importantly, you must complete 8 real-life projects - designed with Figma to complete
                            the course.</p>
                    </div>
                </div>
                <div class="FAQ-section">
                    <div class="support">
                        <h2>Student support</h2>
                        <h3>Will I receive support during my studies?</h3>
                        <p>Of course! Although the exercises have instructions, corresponding correction videos and are
                            explained in as much detail as possible, if you have difficulty, you don't need to worry
                            about not knowing who to ask or not having an instructor.</p>
                        <p>At each lesson at Academy, you can always ask questions, discuss and interact with your
                            classmates.</p>
                        <p>In addition, Academy support specialists will always enthusiastically guide you if you
                            encounter difficulties.</p>
                        <h3>I want to ask,where can I post my question?</h3>
                        <p>There is always a question section in each lesson. You just need to post a new question and
                            wait for a response from the support team within a few minutes. In addition, even the
                            students in the course can participate in supporting each other, so please rest assured!</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
     tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel" style="color: #000; font-weight: 500;">
                    ATTENTION!!!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure to buy this course?
            </div>
            <div class="modal-footer">
                <button class="btn-primary btnModalBuyCourse btnModalBuyCourse__Close" data-bs-dismiss="modal">Close
                </button>
                <button class="btn-secondary btnModalBuyCourse btnModalBuyCourse__Buy" data-bs-dismiss="modal"
                        data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Buy
                </button>

            </div>
        </div>
    </div>
</div>


<%--    Day la modal khi mua khoa hoc that bai vi thieu tien--%>
<div class="modal fade modalFail" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
     tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel2" style="color: #000; font-weight: 500;"><i
                        class="fa-regular fa-bell"></i>Notification</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Not enough money
            </div>
            <div class="modal-footer">
                <button class="btn-secondary btnModalBuyCourse btnModalBuyCourse__Close" data-bs-dismiss="modal">Close
                </button>
                <button type="button" class=" btn-primary  btnModalBuyCourse"
                        style="background: linear-gradient(to right, #ef3e0f, #ffb800);">
                    <a href="../payment/index.jsp" style=" color: #fff">Recharge</a>
                </button>

            </div>
        </div>
    </div>
</div>

<%--        thong bao khi mua khoa hoc thanh cong--%>

<%--    <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">--%>
<div class="toast successNotification" style="position: fixed; top: 12rem; right: 0;" data-autohide=true
     data-delay="10000">
    <div class="toast-header">
        <strong class="mr-auto"><i class="fa-regular fa-bell"></i>Notification</strong>
    </div>
    <div class="toast-body">
        Buy the course successfully <i class="fa-solid fa-circle-check" style="margin-left: 2px; color: #4CAF50"></i>
    </div>
</div>
<%--    </div>--%>


</body>


<%--dung de hien thi thong bao mua khoa hoc thanh cong--%>
<%--<script>--%>
<%--    // Show toast when document is ready--%>
<%--    $(document).ready(function(){--%>
<%--        $('.toast').toast('show');--%>
<%--    });--%>
<%--</script>--%>


<%@include file="../Component/footer.jsp" %>
