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
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="name-user">
                                <label for="Name-user-add">Name's user</label>
                                <input list="_Name-user" name="UserId" id="Name-user-add"
                                       placeholder="Choose a user" required>
                                <datalist id="_Name-user">
                                    <option value="Dang Khanh">
                                </datalist>
                            </div>
                            <div class="money">
                                <label for="Money-add">Money</label>
                                <input type="number" placeholder="Enter amount of money" name="AmountOfMoney"
                                       id="Money-add">
                            </div>
                            <div class="status">
                                <label for="status-add">Status</label>
                                <input list="_Status-name-add" name="StatusId" id="status-add"
                                       placeholder="Choose a status" required>
                                <datalist id="_Status-name-add">
                                    <option value="Successful">
                                </datalist>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <a href="../dashboard_deposit" class="btn btn-primary">Confirm</a>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- --------------------------------------------------------------->

        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID Deposit</th>
                    <th onclick="sortTable(1)" >Name user</th>
                    <th onclick="sortTable(2)">Amount of money</th>
                    <th onclick="sortTable(3)">Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Dang Khanh</td>
                    <td>50000$</td>
                    <td>Successful</td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-deposit" style="border: none;"
                                title="Update deposit">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!--------------- MODAL UPDATE DEPOSIT-------------- -->
                        <div class="modal fade modal__update" id="modal__update-deposit">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="btn-close"
                                                data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- <div class="name-user">
                                            <label for="Name-user-update">Name's user</label>
                                            <input list="_Name-user" name="UserId" id="Name-user-update"
                                                placeholder="Choose a user" required>
                                            <datalist id="_Name-user">
                                                <option value="Dang Khanh">
                                            </datalist>
                                        </div> -->
                                        <div class="money">
                                            <label for="Money-update">Money</label>
                                            <input type="number" placeholder="Enter amount of money"
                                                   name="AmountOfMoney" id="Money-update">
                                        </div>
                                        <div class="status">
                                            <label for="status-update">Status</label>
                                            <input list="_Status-name-update" name="StatusId" id="status-update"
                                                   placeholder="Choose a status" required>
                                            <datalist id="_Status-name-update">
                                                <option value="Successful">
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="../dashboard_deposit"
                                           class="btn btn-primary">Confirm</a>
                                        <button type="button" class="btn btn-danger"
                                                data-bs-dismiss="modal">No</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete-category" title="Delete deposit">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete-category">
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
                                    <a href="../dashboard_deposit" class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </tr>
                <!-- ------------------------------------------------->
                <script src="../assets/js/Sort_table/sort-table.js"></script>
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