<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>

<body>
    <link rel="stylesheet" href="../assets/css/BuyCourse/BuyCourse.css">
    <div class="buy-course">
        <div class="buy-course-content">
            <div class="side-bar">
                <div class="course-name-box">
                    <h2>Course's name:</h2>
                    <span class="course-name">HTML CSS Pro</span>
                </div>
                <div class="course-id-box">
                    <h2>Course's ID:</h2>
                    <span class="course-id">F8C1FHP8</span>
                </div>
                <hr class="buy-course-divider">
                <div class="voucher-input">
                    <form action="" class="voucher-input-typeID">
                        <input type="text" name="" id="" placeholder="Type voucher's ID here">
                        <button class="btnBC btn-apply-voucherID"><span>APPLY</span></button>
                    </form>
                </div>
                <div class="buy-course-detail">
                    <div class="buy-course-detail-subtitle">
                        <h2>Payment details:</h2>
                    </div>
                    <div class="buy-course-detail-wrapper">
                        <div class="price-box">
                            <span class="price-desc">Price:</span>
                            <span class="price-detail">1.299.000 vnd</span>
                        </div>
                        <hr class="buy-course-divider">
                        <div class="price-box price-reduced">
                            <span class="price-desc">Reduced price:</span>
                            <span class="price-detail">0 vnd</span>
                        </div>
                        <hr class="buy-course-divider">
                        <div class="price-box total-price-box">
                            <span class="price-desc">Total price:</span>
                            <span class="price-detail">1.299.000 vnd</span>
                        </div>
                    </div>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary btnBC btn-buy-course" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        BUY COURSE
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color: #000; font-weight: 500;">ATTENTION !!!</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <h3 style="color:#000; font-weight: 400; font-size:14px">Are you sure to buy this course?</h3>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary btnBC btn-buy-course btnModalBuyCourse" data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary btnBC btn-buy-course btnModalBuyCourse">Buy</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="buy-course-desc">
                <div class="will-learn">
                    <h1 class="will-learn__title">
                        What will you learn?
                    </h1>
                    <%
                    int numberOfChapters = 8;
                    %>

                    <ul class="will-learn-list">
                        <%for(int i = 1; i <= numberOfChapters; i++){%>
                            <ul class="will-learn-list-review">Chapter Name
                                <%int numberOfVideos = 7;%>
                                <%for(int j = 1; j <= numberOfVideos; j++){%>
                                <li>Lesson Nameeeeeeeeee</li>
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
                            <p>This course is VERY suitable for people who are completely unfamiliar with HTML and CSS (F8's design focuses on newbies). You only need to know how to use a computer at a basic level to participate in the class.</p>
                            <h3>If I already know HTML and CSS, is this course still suitable?</h3>
                            <p>Even if you already know HTML and CSS, this course is still VERY necessary for you. The course covers a lot of in-depth knowledge that no other course normally covers (you can try it out and see the lesson outline).Even if you already know HTML and CSS, this course is still VERY necessary for you. The course covers a lot of in-depth knowledge that no other course normally covers (you can try it out and see the lesson outline).</p>
                            <p>Furthermore, this course has many types of interesting and engaging lessons such as: challenging exercises, bonus games to support learning, independent challenges with many students participating, etc.</p>
                        </div>
                    </div>
                    <div class="FAQ-section">
                        <div class="benenfit">
                            <h2>Benefits</h2>
                            <h3>How many times can I watch the video?</h3>
                            <p>With the videos you have learned, you can freely watch any video you want, with no limit on the number of times you watch the video. F8 even encourages you to watch as much as possible to better grasp your knowledge.</p>
                            <h3>When can I study?</h3>
                            <p>The lecture has been pre-designed, with detailed and complete content. As long as you have the Internet, you can study anytime, anywhere. You can always take the initiative in time and location without worrying about anything.</p>
                        </div>
                    </div>
                    <div class="FAQ-section">
                        <div class="application">
                            <h2>Practical application</h2>
                            <h3>Can I apply immediately after studying?</h3>
                            <p>Sure! F8 always focuses on students and goes hand in hand with practice. Therefore, after each video or text lesson, you will do a lot of exercises to condense your knowledge, master the syntax, and even do a new coding challenge.</p>
                            <p>Most importantly, you must complete 8 real-life projects - designed with Figma to complete the course.</p>
                        </div>
                    </div>
                    <div class="FAQ-section">
                        <div class="support">
                            <h2>Student support</h2>
                            <h3>Will I receive support during my studies?</h3>
                            <p>Of course! Although the exercises have instructions, corresponding correction videos and are explained in as much detail as possible, if you have difficulty, you don't need to worry about not knowing who to ask or not having an instructor.</p>
                            <p>At each lesson at F8, you can always ask questions, discuss and interact with your classmates.</p>
                            <p>In addition, F8 support specialists will always enthusiastically guide you if you encounter difficulties.</p>
                            <h3>I want to ask,where can I post my question?</h3>
                            <p>There is always a question section in each lesson. You just need to post a new question and wait for a response from the support team within a few minutes. In addition, even the students in the course can participate in supporting each other, so please rest assured!</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</body>


<%@include file="../Component/footer.jsp"%>
