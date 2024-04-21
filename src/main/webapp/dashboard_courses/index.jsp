<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <h1 class="manage-courses__title title">Manage courses</h1>
            <a href="../dashboard_courses/add-courses.jsp" class="btn-dashboard btn__add-courses"><i
                    class="fa-solid fa-plus"></i>Add new courses</a>
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
                    <td><a href="../Courses_details_admin"><i class="fa-solid fa-eye"></i></a>
                        <a href="../dashboard_courses/update-courses.jsp"><i class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade" id="modal__delete">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <!-- <h4 class="modal-title">Delete User</h4> -->
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <div class="modal-body border-0">
                                    <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                                    <p>Are you sure you want to delete?</p>
                                    <p>Deleted data cannot be recovered.</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="../dashboard_courses" class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ------------------------------------->
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