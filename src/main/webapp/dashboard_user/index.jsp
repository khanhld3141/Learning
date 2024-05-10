<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-users">
        <div class="manage-user__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-user__title title">Manage Users</h1>
                <form action="/dashboard/users" method="get" class="search-form">
                    <input type="text" placeholder="Search name user" class="search-input" name="query">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <a href="/dashboard/create-user" class="btn-dashboard btn__add-users"><i
                    class="fa-solid fa-plus"></i>Add new user</a>
        </div>
        <div class="table">
            <table class="custom-table table__users" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID USER</th>
                    <th onclick="sortTable(1)">Name</th>
                    <th onclick="sortTable(2)">Phone</th>
                    <th onclick="sortTable(3)">Email</th>
                    <th onclick="sortTable(4)">Username</th>
                    <th onclick="sortTable(5)">Password</th>
                    <th onclick="sortTable(6)">Balance</th>
                    <th onclick="sortTable(7)">Role</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("users") != null) {
                        List<User> list = (List<User>) request.getAttribute("users");
                        for (User user : list) {
                            String role = "";
                            if (user.getRole().equals("R1")) {
                                role = "Admin";
                            } else if (user.getRole().equals("R2")) {
                                role = "Teacher";
                            } else if (user.getRole().equals("R3")) {
                                role = "Student";
                            }

                %>
                <tr>
                    <td><%=user.getId()%>
                    </td>
                    <td><%=user.getName()%>
                    </td>
                    <td><%=user.getPhone()%>
                    </td>
                    <td><%=user.getEmail()%>
                    </td>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getBalance()%>$</td>
                    <td><%=role%>
                    </td>
                    <td><a href="/dashboard/update-user?id=<%=user.getId()%>" title="Update user"><i
                            class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=user.getId()%>" title="Delete user">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=user.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <!-- <h4 class="modal-title">Delete User</h4> -->
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <div class="modal-body border-0">
                                    <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                                    <p>Are you sure you want to delete?</p>
                                    <p>Deleted data
                                        cannot be recovered.</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="/dashboard/delete-user?id=<%=user.getId()%>" class="btn btn-primary">Yes
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
                <!-- SORT TABLE -->
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
        let query = <%=request.getParameter("query") !=null ? request.getParameter("query").toString() :""%>;
        let currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1
         %>;
        let previousPage = currentPage - 1;
        if (previousPage >= 1) {
            if (query != "") {
                alert(query)
                let queryString = "/dashboard/users?page=" + previousPage.toString() + "&query=" + query;
                window.location.href = queryString;
            } else {
                alert("not")
                window.location.href = "/dashboard/users?page=" + previousPage;
            }
        }
    }

    function nextPage() {
        let query = <%=request.getParameter("query") !=null ? request.getParameter("query").toString() :""%>;
        let currentPage = <%= request.getParameter("page") != null ?
            Integer.parseInt(request.getParameter("page")) : 1
         %>;
        let nextPage = currentPage + 1;
        if (query !== "") {
            alert("query")
            let queryString = "/dashboard/users?page=" + nextPage.toString() + "&query=" + query;
            window.location.href = queryString;
        } else {
            alert("not")
            window.location.href = "/dashboard/users?page=" + nextPage;
        }
    }

    window.onload = function () {
        let currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1
         %>;
        let previousButton = document.getElementById("prev");
        if (currentPage == 1) {
            previousButton.disabled = true;
        } else {
            previousButton.disabled = false;
        }
    };
</script>
</body>
</html>