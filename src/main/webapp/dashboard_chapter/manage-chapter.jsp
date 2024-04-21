<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-chapters__block-title manage-block">
            <h1 class="manage-chapters__title title">Manage chapters</h1>
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
                                <input type="text" name="Name" id="Name-Add" placeholder="Enter name chapter" required>
                            </div>
                            <div class="ordinal-chapter">
                                <label for="Ordinal-Add">Ordinal Chapter</label>
                                <input type="number" name="Ordinal" id="Ordinal-Add"
                                       placeholder="Enter ordinal chapter" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="../dashboard_chapter/manage-chapter.jsp" class="btn btn-primary">Confirm</a>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- --------------------------------------------------------------->

        </div>
        <div class="table">
            <table class="custom-table table__users">
                <thead>
                <tr>
                    <th>ID Chapters</th>
                    <th>Name Chapters</th>
                    <th>Belongs to the courses</th>
                    <th>Ordinal</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>CH123</td>
                    <td>Build a Project in HTML 5</td>
                    <td>HTML And Javascript</td>
                    <td>1</td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-chapter" style="border: none;">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        <a href="../dashboard_lesson/manage-lesson.jsp"><i class="fa-solid fa-wrench" style="font-size: 16px; padding: 0 8px;"></i>Modify lessons</a>
                    </td>
                    <!--------------- MODAL UPDATE CHAPTER-------------- -->
                    <div class="modal fade modal__update" id="modal__update-chapter">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close"
                                            data-bs-dismiss="modal"></button>
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
                                    <a href="../dashboard_chapter/manage-chapter.jsp"
                                       class="btn btn-primary">Confirm</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade" id="modal__delete">
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
                                    <a href="../dashboard_chapter/manage-chapter.jsp" class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ------------------------------------------------->

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
        </div>
    </div>
</div>
</body>
</html>