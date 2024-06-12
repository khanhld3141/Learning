<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<%--<%@include file="../Component/notify.jsp" %>--%>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-courses__title title">Manage courses</h1>
                <form action="/dashboard/courses" method="get" class="search-form">
                    <input type="text" placeholder="Search name courses" class="search-input" name="query">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <a href="/dashboard/create-course" class="btn-dashboard btn__add-courses"><i
                    class="fa-solid fa-plus"></i>Add new courses</a>
        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID Courses</th>
                    <th onclick="sortTable(1)">Name</th>
                    <th onclick="sortTable(2)">Category</th>
                    <th onclick="sortTable(3)">Price</th>
                    <th onclick="sortTable(4)">Teacher</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("courses") != null) {
                        List<Course> courses = (List<Course>) request.getAttribute("courses");
                        for (Course c : courses) {
                %>
                <tr>
                    <td><%=c.getId()%>
                    </td>
                    <td><%=c.getName()%>
                    </td>
                    <td><%=c.getCategory().getName()%>
                    </td>
                    <td><%=c.getPrice()%>$</td>
                    <td><%=c.getTeacher().getName()%>
                    </td>
                    <td>
                        <a href="/dashboard/update-course?id=<%=c.getId()%>" title="Edit course"><i
                                class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=c.getId()%>" title="Delete course">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        <a href="/dashboard/chapter?courseid=<%=c.getId()%>"
                           title="Manage chapters"><i class="fa-solid fa-eye"></i></a>
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__add-student-into-courses_<%=c.getId()%>"
                                title="Add student into this course">
                            <i class="fa-solid fa-user-plus" style="color: green; font-size: 16px"></i>
                        </button>
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__remove-student-into-courses_<%=c.getId()%>"
                                title="Remove student into this course">
                            <i class="fa-solid fa-user-plus" style="color: green; font-size: 16px"></i>
                        </button>
                        <%-- MODAL ADD STUDENT INTO COURSES --%>
                        <div class="modal fade modal__add" id="modal__add-student-into-courses_<%=c.getId()%>">
                            <div class="modal-dialog modal-dialog-centered">

                                <form action="/create-user-course" method="post" style="width: 100%">

                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <h3>ADD STUDENT INTO COURSE</h3>
                                            <span>Course Name: <%=c.getName()%></span>
                                            <input name="courseid" value="<%=c.getId()%>" hidden="hidden">
                                            <div class="student-name">
                                                <label for="student-name">Email</label>
                                                <input name="email" id="student-name"
                                                       placeholder="Enter username" type="email" required>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Confirm</button>
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <%-- MODAL REMOVE STUDENT OF COURSES --%>
                        <div class="modal fade modal__add" id="modal__remove-student-into-courses_<%=c.getId()%>">
                            <div class="modal-dialog modal-dialog-centered">

                                <form action="/delete-user-course" method="post" style="width: 100%">

                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>

                                        <div class="modal-body">
                                            <h3>REMOVE STUDENT </h3>
                                            <span>Course Name: <%=c.getName()%></span>
                                            <input name="courseid" value="<%=c.getId()%>" hidden="hidden">
                                            <div class="student-name">
                                                <label for="student-name-remove">Email</label>
                                                <input name="email" id="student-name-remove"
                                                       placeholder="Enter username" type="email" required>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Confirm</button>
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=c.getId()%>">
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
                                    <a href="/dashboard/delete-course?id=<%=c.getId()%>" class="btn btn-primary">Yes
                                    </a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ------------------------------------->
                </tr>
                <%
                        }
                    }
                %>

                <script src="../assets/js/Sort_table/sort-table.js"></script>
                </tbody>
            </table>
            <div class="clearfix">
                <div class="hint-text">Showing <b>10</b> out of <b>50</b> entries</div>
                <ul class="pagination">
                    <li id="prev" onclick="previousPage()"
                        class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li id="next" onclick="nextPage()" class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
            <!-- Generated at CSSPortal.com -->
        </div>
    </div>
</div>
<script>
    function previousPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousPage = currentPage - 1;
        if (previousPage >= 1) {
            window.location.href = "/dashboard/courses?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/dashboard/courses?page=" + nextPage;
    }

    window.onload = function () {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousButton = document.getElementById("prev");
        if (currentPage == 1) {
            previousButton.disabled = true;
        } else {
            previousButton.disabled = false;
        }
    };
</script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script type="text/javascript">
    function showToast(message, type) {
        let backgroundColor, className;
        if (type === "1") {
            backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
            className = "success"
        } else if (type === "0") {
            backgroundColor = "linear-gradient(to right, #ff5f6d, #ffc371)";
            className = "error"
        }

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "bottom",
            position: "right",
            backgroundColor: backgroundColor,
            stopOnFocus: true,
            className: className,

        }).showToast();
    }

    <%
        if (session.getAttribute("success")!=null) {
    %>
    showToast("<%= session.getAttribute("success") %>", "1");
    <%
    session.setAttribute("success",null);
      }
    %>

    <%

      if (session.getAttribute("error")!=null) {
  %>
    showToast("<%= session.getAttribute("error") %>", "0");
    <%
    session.setAttribute("error",null);
      }
    %>
</script>
</body>
</html>