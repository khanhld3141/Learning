<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-lessons">
        <div class="manage-lessons__block-title manage-block">
            <h1 class="manage-chapters__title title">Manage lessons</h1>
            <!-------Button trigger ADD NEW lesson modal-------- -->
            <button type="button" class="btn-dashboard btn__add-lessons" data-bs-toggle="modal"
                    data-bs-target="#modal__add-new-lesson" style="border: none;">
                <i class="fa-solid fa-plus"></i>Add new lesson
            </button>
            <!--------------- MODAL ADD NEW lesson-------------- -->
            <div class="modal fade modal__add" id="modal__add-new-lesson">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="name-lesson">
                                <label for="Name-Add">Name lesson</label>
                                <input type="text" name="Name" id="Name-Add" placeholder="Enter name lesson"
                                       required>
                            </div>
                            <div class="description-lesson">
                                <label for="Description-Add">Description lesson</label>
                                <textarea name="Description" id="Description-Add" rows="10" required
                                          placeholder="Enter description lesson"></textarea>
                            </div>
                            <div class="link-lesson">
                                <label for="Link-Add">Link lesson</label>
                                <input type="url" name="Link" id="Link-Add" placeholder="Enter link lesson"
                                       required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="../dashboard_lesson/manage-lesson.jsp" class="btn btn-primary">Confirm</a>
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
                    <th>ID lesson</th>
                    <th>Name lesson</th>
                    <th>Belongs to chapter</th>
                    <th>Belongs to the course</th>
                    <th>Link lesson</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>LS123</td>
                    <td>HTML Attributes</td>
                    <td>Introduction to basic HTML</td>
                    <td>HTML5 for beginners</td>
                    <td><a href="#!">Link lesson</a></td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-lesson" style="border: none;">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL UPDATE LESSON-------------- -->
                    <div class="modal fade modal__update" id="modal__update-lesson">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close"
                                            data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="name-lesson">
                                        <label for="Name-Update">Name lesson</label>
                                        <input type="text" name="Name" id="Name-Update"
                                               placeholder="Enter name lesson" required>
                                    </div>
                                    <div class="description-lesson">
                                        <label for="Description-Update">Description lesson</label>
                                        <textarea name="Description" id="Description-Update" rows="10" required
                                                  placeholder="Enter description lesson"></textarea>
                                    </div>
                                    <div class="link-lesson">
                                        <label for="Link-Update">Link lesson</label>
                                        <input type="url" name="Link" id="Link-Update"
                                               placeholder="Enter link lesson" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="../dashboard_lesson/manage-lesson.jsp" class="btn btn-primary">Confirm</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
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
                                    <a href="../dashboard_lesson/manage-lesson.jsp" class="btn btn-primary">Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
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