<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp"%>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="courses-participated">
                        <h2 class="profile-right__title">Courses participated</h2>
                        <div class="table">
                            <table class="courses-participated-table">
                                <thead>
                                <tr>
                                    <th>ID Course</th>
                                    <th>Name course</th>
                                    <th>Category</th>
                                    <th>Teacher</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="#!">1</a></td>
                                    <td><a href="#!">HTML CSS Javascript</a></td>
                                    <td><a href="#!">FE</a></td>
                                    <td><a href="#!">Dang Khanh</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp"%>