<%@ page import="java.util.List" %>
<%@ page import="model.Lession" %>
<%@ page import="model.Chapter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-lessons">
        <div class="manage-lessons__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-lessons__title title">Manage lessons</h1>
                <form action="" class="search-form">
                    <input type="text" placeholder="Search name lesson" class="search-input" name="Name">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <!-------Button trigger ADD NEW lesson modal-------- -->
            <button type="button" class="btn-dashboard btn__add-lessons" data-bs-toggle="modal"
                    data-bs-target="#modal__add-new-lesson" style="border: none;" title="Update new lesson">
                <i class="fa-solid fa-plus"></i>Add new lesson
            </button>
            <!--------------- MODAL ADD NEW lesson-------------- -->
            <div class="modal fade modal__add" id="modal__add-new-lesson">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <%
                            if (request.getAttribute("chapter") != null) {
                                Chapter chapter = (Chapter) request.getAttribute("chapter");


                        %>
                        <form name="form-add" action="/dashboard/create-lession" method="post"
                              enctype="multipart/form-data">
                            <div class="modal-body">
                                <input name="chapterid" type="text" value="<%=chapter.getId()%>" readonly>
                                <div class="name-lesson">
                                    <label for="Name-Add">Name lesson</label>
                                    <input type="text" name="name" id="Name-Add" placeholder="Enter name lesson"
                                           required>
                                </div>
                                <div class="description-lesson">
                                    <label for="Description-Add">Description lesson</label>
                                    <textarea name="description" id="Description-Add" rows="10" required
                                              placeholder="Enter description lesson"></textarea>
                                </div>
                                <div class="Video-lesson">
                                    <label for="FileUpload-Add">Upload new video</label>
                                    <input type="file" name="video" id="FileUpload-Add"
                                           placeholder="Enter video lesson" required>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" value="Confirm">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                </div>
                            </div>

                        </form>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <!-- --------------------------------------------------------------->

        </div>
        <div class="table">
            <table class="custom-table" id="table-sort">
                <thead>
                <tr>
                    <th onclick="sortTable(0)">ID lesson</th>
                    <th onclick="sortTable(1)">Name lesson</th>
                    <th onclick="sortTable(2)">Description</th>
                    <th>Link lesson</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("lessions") != null) {
                        List<Lession> lessions = (List<Lession>) request.getAttribute("lessions");
                        for (Lession l : lessions) {

                %>
                <tr>
                    <td><%=l.getId()%>
                    </td>
                    <td><%=l.getName()%>
                    </td>
                    <td><%=l.getDescription()%>
                    </td>
                    <td><a href="/images/<%=l.getLink()%>">Link lesson</a></td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-lesson_<%=l.getId()%>" style="border: none;"
                                title="Update lesson">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=l.getId()%>" title="Delete lesson">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL UPDATE LESSON-------------- -->
                    <div class="modal fade modal__update" id="modal__update-lesson_<%=l.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close"
                                            data-bs-dismiss="modal"></button>
                                </div>
                                <form action="/dashboard/update-less">
                                    <div class="modal-body">
                                        <div class="name-lesson">
                                            <label for="Name-Update">Name lesson</label>
                                            <input value="<%=l.getName()%>" type="text" name="Name" id="Name-Update"
                                                   placeholder="Enter name lesson" required>
                                        </div>
                                        <div class="description-lesson">
                                            <label for="Description-Update">Description lesson</label>
                                            <textarea name="Description" id="Description-Update" rows="10" required
                                                      placeholder="Enter description lesson"><%=l.getDescription()%></textarea>
                                        </div>
                                        <div class="Video-lesson">
                                            <label for="FileUpload-Update">Upload new video</label>
                                            <input type="file" name="video" id="FileUpload-Update"
                                                   placeholder="Enter video lesson" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Confirm</button>
                                        <button type="button" class="btn btn-danger"
                                                data-bs-dismiss="modal">No
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=l.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <%
                                if (request.getAttribute("chapter") != null) {
                                    Chapter chapter = (Chapter) request.getAttribute("chapter");
                            %>
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
                                    <a href="/dashboard/delete-lession?id=<%=l.getId()%>&chapterid=<%=chapter.getId()%>"
                                       class="btn btn-primary">
                                        Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!-- ------------------------------------------------->
                </tr>
                <%
                        }
                    }
                %>
                <!-- SORT TABLE-->
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