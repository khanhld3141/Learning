<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/7/2024
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>


<main>
    <%--ảnh đầu trang--%>
    <div class="page-feature">
        <div class="container-text">
            <h2>Events</h2>
            <div class="bread-crum">
                <a href="#!" class="back">Home</a>
                <span>/Events</span>
            </div>
        </div>
    </div>


    <div class="events">

        <%--head của trang events--%>
        <div class="events-head">
            <div class="main-content">
                <h1 class="first-head">LATEST EVENT</h1>
                <h1 class="second-head">Community affairs and integrated events</h1>
            </div>
        </div>

        <%--begin events group 1--%>
        <div class="events-group">
            <div class="main-content">
                <div class="events-group__title">ONGOING</div>

                <%--            item 1--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href="#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>

                <%--            item 2--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href = "#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>

                <%--            item 3--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href ="#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>
            </div>

        </div>

<%--            end events group 1--%>

        <%--begin events group 2--%>
        <div class="events-group">
            <div class="main-content">
                <div class="events-group__title">UPCOMING</div>

                <%--            item 1--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href="#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>

                <%--            item 2--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href = "#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>

                <%--            item 3--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href ="#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>
            </div>

        </div>

<%--            end events group 2--%>

        <%--begin events group 3--%>
        <div class="events-group">
            <div class="main-content">
                <div class="events-group__title">EXPIRED</div>

                <%--            item 1--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href="#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>

                <%--            item 2--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href = "#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>

                <%--            item 3--%>
                <div class="events-group__item">
                    <div class="date--round">
                        <h1 class="date--rount__time">20 SEP</h1>
                    </div>

                    <div class="content">
                        <h1 class="content__time">2PM to 5PM</h1>
                        <a href ="#!" class="content__name">Consectetur adipisicing elit.</a>
                        <p class="content__text">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vitae sunt pariatur ut est natus magni.</p>
                    </div>
                </div>
            </div>

        </div>

<%--        end events group 3--%>


    </div>



</main>




<%@include file="../Component/footer.jsp"%>
