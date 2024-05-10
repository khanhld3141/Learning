<%@ page import="java.util.List" %>
<%@ page import="model.Voucher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-vouchers">
        <div class="manage-voucher__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-voucher__title title">Manage Voucher</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search code voucher" class="search-input" name="Code">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <a href="../dashboard_voucher/add-voucher.jsp" class="btn-dashboard btn__add-users"><i
                    class="fa-solid fa-plus"></i>Add new voucher</a>
        </div>
        <div class="table">
            <table class="custom-table table__users" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID VOUCHER</th>
                    <th onclick="sortTable(1)">Code</th>
                    <th onclick="sortTable(2)">Start Day</th>
                    <th onclick="sortTable(3)">End Day</th>
                    <th onclick="sortTable(4)">Quantity</th>
                    <th onclick="sortTable(5)">Used</th>
                    <th onclick="sortTable(6)">Discount</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("vouchers") != null) {
                        List<Voucher> vouchers = (List<Voucher>) request.getAttribute("vouchers");

                        for (Voucher v : vouchers) {


                %>
                <tr>
                    <td><%=v.getId()%></td>
                    <td><%=v.getCode()%></td>
                    <td><%=v.getStartDay()%></td>
                    <td><%=v.getEndDay()%></td>
                    <td><%=v.getQuantity()%></td>
                    <td><%=v.getUsed()%></td>
                    <td><%=v.getDiscount()%></td>
                    <td><a href="/dashboard/update-voucher?id=<%=v.getId()%>" title="Edit voucher"><i class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=v.getId()%>" title="Delete voucher">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=v.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>

                                <div class="modal-body border-0">
                                    <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                                    <p>Are you sure you want to delete?</p>
                                    <p>Deleted data
                                        cannot be recovered.</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="/dashboard/delete-voucher?id=<%=v.getId()%>" class="btn btn-primary">
                                        Yes</a>
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
            window.location.href = "/dashboard/vouchers?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/dashboard/vouchers?page=" + nextPage;
    }
    window.onload = function() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousButton = document.getElementById("prev");
        if (currentPage == 1) {
            previousButton.disabled = true;
        } else {
            previousButton.disabled = false;
        }
    };
</script>
</body>
</html>