<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-lessons">
        <div class="manage-lessons__block-title manage-block">
            <h1 class="manage-lessons__title title">List chapters</h1>
        </div>
        <div class="table">
            <table class="custom-table table__users">
                <thead>
                <tr>
                    <th>ID Chapters</th>
                    <th>Name Chapters</th>
                    <th>Belongs to the courses</th>
                    <th>Ordinal</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>CH123</td>
                    <td>Build a Project in HTML 5</td>
                    <td>HTML And Javascript</td>
                    <td>1</td>
                    <td><a href="../dashboard_lesson/manage-lesson.jsp" class="modify-lessons"><i
                            class="fa-solid fa-pen"></i>Modify list lessons</a></td>
                </tr>

                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>10</b> out of <b>50</b> entries</div>
                <ul class="pagination">
                    <li class="page-item"><a href="#" class="page-link">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>