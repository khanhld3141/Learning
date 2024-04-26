<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-categories">
        <div class="manage-categories__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-categories__title title">Manage categories</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search name category" class="search-input" name="Name">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <!-------Button trigger ADD NEW CATEGORY modal-------- -->
            <button type="button" class="btn-dashboard btn__add-categories" data-bs-toggle="modal"
                    data-bs-target="#modal__add-new-category" style="border: none;">
                <i class="fa-solid fa-plus"></i>Add new category
            </button>
            <!--------------- MODAL ADD NEW CATEGORY-------------- -->
            <div class="modal fade modal__add" id="modal__add-new-category">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="name-category">
                                <label for="name-category-add">Name Category</label>
                                <input type="text" name="Name" id="name-category-add" placeholder="Enter name category">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="../dashboard-category" class="btn btn-primary">Confirm</a>
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
                    <th onclick=" sortTable(0)">ID Category</th>
                    <th onclick="sortTable(1)">Name Category</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Data Science</td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-category" style="border: none;" title="Edit category">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!--------------- MODAL UPDATE CHAPTER-------------- -->
                        <div class="modal fade modal__update" id="modal__update-category">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="btn-close"
                                                data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="name-category">
                                            <label for="name-category-update">Name Category</label>
                                            <input type="text" name="Name" id="name-category-update"
                                                   placeholder="Enter name category">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="../dashboard-category"
                                           class="btn btn-primary">Confirm</a>
                                        <button type="button" class="btn btn-danger"
                                                data-bs-dismiss="modal">No</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete-category" title="Delete category">
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
                                    <a href="../dashboard-category" class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ------------------------------------------------->
                </tr>

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