<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp" %>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="courses-participated">
                        <h2 class="profile-right__title">My courses</h2>
                        <div class="table">
                            <table class="courses-participated-table" id="table-sort">
                                <thead>
                                <tr>
                                    <th onclick="sortTable(0)">ID Course</th>
                                    <th onclick="sortTable(1)">Name course</th>
                                    <th onclick="sortTable(2)">Category</th>
                                    <th onclick="sortTable(3)">Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (request.getAttribute("courses") != null) {
                                        List<Course> courses = (List<Course>) request.getAttribute("courses");
                                        for (Course c : courses) {

                                %>
                                <tr style="align-items: center" onclick="redirectToAnchor(this)">
                                    <%-- bỏ link của mỗi bài viết ở thẻ a dưới đây (nằm trong thẻ td chứa id) là được--%>
                                    <td><a href="/learning?courseid=<%=c.getId()%>"><%=c.getId()%>
                                    </a></td>
                                    <td><%=c.getName()%>
                                    </td>
                                    <td>
                                        <img style="width: 100px;object-fit: cover" src="/images/<%=c.getImage()%>">
                                    </td>
                                    <td>
                                        <a href="/learning?courseid=<%=c.getId()%>" title="View this course"
                                           style="margin-right: 14px; color: #196fee"><i
                                                class="fa-solid fa-eye"></i></a>
                                    </td>

                                </tr>
                                <%
                                        }
                                    }
                                %>
                                </tbody>
                                <script>
                                    function redirectToAnchor(row) {
                                        var anchor = row.querySelector('a');
                                        if (anchor) {
                                            window.location.href = anchor.href;
                                        }
                                    }
                                </script>
                                <script src="../assets/js/Sort_table/sort-table.js"></script>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>