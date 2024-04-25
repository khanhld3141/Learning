<%@ page import="java.util.List" %>
<%@ page import="model.Voucher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-vouchers">
        <div class="manage-voucher__block-title manage-block">
            <h1 class="manage-voucher__title title">Manage Voucher</h1>
            <a href="../dashboard_voucher/add-voucher.jsp" class="btn-dashboard btn__add-users"><i
                    class="fa-solid fa-plus"></i>Add new voucher</a>
        </div>
        <div class="table">
            <table class="custom-table table__users">
                <thead>
                <tr>
                    <th>ID VOUCHER</th>
                    <th>Code</th>
                    <th>StartDay</th>
                    <th>EndDay</th>
                    <th>Quantity</th>
                    <th>Used</th>
                    <th>Discount</th>
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
                    <td><a href="/dashboard/update-voucher?id=<%=v.getId()%>"><i class="fa-solid fa-pen"></i></a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=v.getId()%>">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE-------------- -->
                    <div class="modal fade" id="modal__delete_<%=v.getId()%>">
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