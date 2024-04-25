<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <h1 class="manage-courses__title title">List courses</h1>
        </div>
        <div class="table">
            <table class="custom-table table__users">
                <thead>
                <tr>
                    <th>ID Courses</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Teacher</th>
                    <th>Quantity chapters</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>C123</td>
                    <td>Machine Learning</td>
                    <td>Data Science</td>
                    <td>200$</td>
                    <td>Dang Khanh</td>
                    <td>10</td>
                    <td>
                        <a href="../Courses_details_admin"><i class="fa-solid fa-eye" style="padding: 0;"></i></a>
                        <a href="../dashboard_chapter/manage-chapter.jsp" class="modify-chapter"><i class="fa-solid fa-wrench" style="font-size: 16px; padding: 0 4px;"></i>
                            Modify chapters</a>
                    </td>
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
            <!-- Generated at CSSPortal.com -->
        </div>
    </div>
</div>
</body>
</html>