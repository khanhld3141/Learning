<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-chapters">
        <div class="manage-chapters__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-chapters__title title">Manage chapters</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search name chapter" class="search-input" name="Name">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <!-------Button trigger ADD NEW CHAPTER modal-------- -->
            <button type="button" class="btn-dashboard btn__add-chapters" data-bs-toggle="modal"
                    data-bs-target="#modal__add-new-chapter" style="border: none;">
                <i class="fa-solid fa-plus"></i>Add new chapter
            </button>
            <!--------------- MODAL ADD NEW CHAPTER-------------- -->
            <div class="modal fade modal__add" id="modal__add-new-chapter">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="name-chapter">
                                <label for="Name-Add">Name Chapter</label>
                                <input type="text" name="Name" id="Name-Add" placeholder="Enter name chapter"
                                       required>
                            </div>
                            <div class="ordinal-chapter">
                                <label for="Ordinal-Add">Ordinal Chapter</label>
                                <input type="number" name="Ordinal" id="Ordinal-Add"
                                       placeholder="Enter ordinal chapter" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="../dashboard_chapter" class="btn btn-primary">Confirm</a>
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
                    <th onclick="sortTable(0)">ID Chapters</th>
                    <th onclick="sortTable(1)">Name Chapters</th>
                    <th onclick="sortTable(2)">Belongs to the courses</th>
                    <th onclick="sortTable(3)">Ordinal</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Build a Project in HTML 5</td>
                    <td>HTML And Javascript</td>
                    <td>1</td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-chapter" style="border: none;" title="Edit chapter">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete" title="Delete chapter">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        <a href="../dashboard_lesson/index.jsp" title="Manage list lessons"><i
                                class="fa-solid fa-eye" style="font-size: 16px; padding: 0 8px;"></i></a>
                    </td>
                    <!--------------- MODAL UPDATE CHAPTER-------------- -->
                    <div class="modal fade modal__update" id="modal__update-chapter">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="name-chapter">
                                        <label for="Name-Update">Name Chapter</label>
                                        <input type="text" name="Name" id="Name-Update"
                                               placeholder="Enter name chapter" required>
                                    </div>
                                    <div class="ordinal-chapter">
                                        <label for="Ordinal-Update">Ordinal Chapter</label>
                                        <input type="number" name="Ordinal" id="Ordinal-Update"
                                               placeholder="Enter ordinal chapter" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="../dashboard_chapter"
                                       class="btn btn-primary">Confirm</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete">
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
                                    <a href="../dashboard_chapter"
                                       class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ------------------------------------------------->
                </tr>
                <!-- SORT TABLE -->
                <script src="../assets/js/Sort_table/sort-table.js">
                </script>

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