<%@ page import="java.util.List" %>
<%@ page import="model.Deposit" %>
<%@ page import="model.Status" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-deposit">
        <div class="manage-categories__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-deposit__title title">Manage deposit</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search name user" class="search-input" name="Name">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <!-------Button trigger ADD NEW DEPOSIT modal-------- -->
            <button type="button" class="btn-dashboard btn__add-deposit" data-bs-toggle="modal"
                    data-bs-target="#modal__add-new-deposit" style="border: none;">
                <i class="fa-solid fa-plus"></i>Add new deposit
            </button>
            <!--------------- MODAL ADD NEW DEPOSIT-------------- -->
            <div class="modal fade modal__add" id="modal__add-new-deposit">
                <div class="modal-dialog modal-dialog-centered">
                    <form action="/dashboard/create-deposit" method="post" style="width: 100%">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="name-user">
                                    <label for="Name-user-add">Name's user</label>
                                    <input list="_Name-user" name="user" id="Name-user-add"
                                           placeholder="Choose a user" required>
                                    <datalist id="_Name-user">
                                        <%
                                            if (request.getAttribute("users") != null) {
                                                List<User> users = (List<User>) request.getAttribute("users");
                                                for (User user : users) {


                                        %>
                                        <option value="<%=user.getId()%>-<%=user.getName()%>">
                                                <%
                                               }
                                            }
                                               %>
                                    </datalist>
                                </div>
                                <div class="money">
                                    <label for="Money-add">Money</label>
                                    <input type="number" placeholder="Enter amount of money" name="amountofmoney"
                                           id="Money-add">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit">Confirm</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- --------------------------------------------------------------->

        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID Deposit</th>
                    <th onclick="sortTable(1)">Name user</th>
                    <th onclick="sortTable(2)">Amount of money</th>
                    <th onclick="sortTable(3)">Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("deposits") != null) {
                        List<Deposit> deposits = (List<Deposit>) request.getAttribute("deposits");
                        List<Status> statuss=(List<Status>) request.getAttribute("statuss");
                        String  statusValue="";



                        for (Deposit deposit : deposits) {
                            for(Status status : statuss) {
                                if(status.getId()==deposit.getStatusId()){
                                    statusValue=status.getId()+"-"+status.getName();
                                }
                            }

                %>
                <tr>
                    <td><%=deposit.getId()%>
                    </td>
                    <td><%=deposit.getUser().getName()%>
                    </td>
                    <td><%=deposit.getAmountOfMoney()%>$</td>
                    <td><%=deposit.getStatus().getName()%>
                    </td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-deposit_<%=deposit.getId()%>" style="border: none;"
                                title="Update deposit">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!--------------- MODAL UPDATE DEPOSIT-------------- -->
                        <div class="modal fade modal__update" id="modal__update-deposit_<%=deposit.getId()%>">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="btn-close"
                                                data-bs-dismiss="modal"></button>
                                    </div>
                                    <form action="/dashboard/update-deposit" method="post">
                                        <div class="modal-body">
                                            <input name="id" value="<%=deposit.getId()%>" hidden="hidden">
                                            <div class="userId">
                                                <label for="userid-update">User ID</label>
                                                <input name="userid" value="<%=deposit.getUserId()%>" id="userid-update" readonly>
                                            </div>
                                            <div class="money">
                                                <label for="Money-update">Money</label>
                                                <input value="<%=deposit.getAmountOfMoney()%>" type="number"
                                                       placeholder="Enter amount of money"
                                                       name="amountofmoney" id="Money-update">
                                            </div>

                                            <div class="status">
                                                <label for="status-update">Status</label>
                                                <input value="<%=statusValue%>" list="_Status-name-update" name="status"
                                                       id="status-update"
                                                       placeholder="Choose a status" required>
                                                <datalist id="_Status-name-update">
                                                    <%
                                                        if (request.getAttribute("statuss") != null) {
                                                            List<Status> statuses = (List<Status>)
                                                                    request.getAttribute("statuss");
                                                            for (Status status : statuses) {

                                                    %>
                                                    <option value="<%=status.getId()%>-<%=status.getName()%>">
                                                            <%
                                                        }
                                                            }
                                                    %>
                                                </datalist>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-primary" type="submit">Confirm</button>
                                            <button type="button" class="btn btn-danger"
                                                    data-bs-dismiss="modal">No
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>


                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete-deposit_<%=deposit.getId()%>" title="Delete deposit">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete-deposit_<%=deposit.getId()%>">
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
                                    <a href="/dashboard/delete-deposit?id=<%=deposit.getId()%>" class="btn btn-primary">Yes
                                    </a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </tr>
                <%
                        }
                    }
                %>
                <!-- ------------------------------------------------->
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
        </div>
    </div>
</div>
<script>
    function previousPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousPage = currentPage - 1;
        if (previousPage >= 1) {
            window.location.href = "/dashboard/deposits?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/dashboard/deposits?page=" + nextPage;
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