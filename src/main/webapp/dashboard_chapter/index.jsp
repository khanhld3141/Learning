<%@ page import="model.Chapter" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<%@include file="../Component/notify.jsp" %>

<div class="content-admin">
    <div class="manage-chapters">
        <div class="manage-chapters__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-chapters__title title">Manage chapters</h1>
                <form action="/dashboard/chapter" method="get" class="search-form">
                    <input type="text" placeholder="Search name user" class="search-input" name="query">
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
                        <%
                            if(request.getAttribute("course")!=null){
                                Course course = (Course)request.getAttribute("course");

                        %>
                       <form action="/dashboard/create-chapter" method="post">
                           <div class="modal-body">
                               <input name="courseid" type="text"
                                      value="<%=course.getId() %>">
                               <div class="name-chapter">
                                   <label for="Name-Add">Name Chapter</label>
                                   <input type="text" name="name" id="Name-Add" placeholder="Enter name chapter"
                                          required>
                               </div>
                               <div class="ordinal-chapter">
                                   <label for="Ordinal-Add">Ordinal Chapter</label>
                                   <input type="number" name="ordinal" id="Ordinal-Add"
                                          placeholder="Enter ordinal chapter" required>
                               </div>
                           </div>
                           <div class="modal-footer">
                               <button type="submit" class="btn btn-primary">Confirm</button>
                               <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
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
                    <th onclick="sortTable(0)">ID Chapters</th>
                    <th onclick="sortTable(1)">Name Chapters</th>
                    <th onclick="sortTable(2)">Ordinal</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("chapters") != null) {
                        List<Chapter> chapters = (List<Chapter>) request.getAttribute("chapters");
                        for (Chapter chapter : chapters) {


                %>
                <tr>
                    <td><%=chapter.getId()%>
                    </td>
                    <td><%=chapter.getName()%>
                    </td>
                    <td><%=chapter.getOrdinal()%>
                    </td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-chapter_<%=chapter.getId()%>" style="border: none;"
                                title="Edit chapter">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete_<%=chapter.getId()%>" title="Delete chapter">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        <a href="/dashboard/lessions?chapterid=<%=chapter.getId()%>" title="Manage list lessons"><i
                                class="fa-solid fa-eye" style="font-size: 16px; padding: 0 8px;"></i></a>
                    </td>
                    <!--------------- MODAL UPDATE CHAPTER-------------- -->
                    <div class="modal fade modal__update" id="modal__update-chapter_<%=chapter.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <%
                                    if(request.getAttribute("course")!=null){
                                        Course course = (Course)request.getAttribute("course");

                                %>
                                <form action="/dashboard/update-chapter" method="post">
                                    <div class="modal-body">
                                        <input name="id" readonly type="text" value="<%=chapter.getId()%>">
                                        <input name="courseid" type="text"
                                               value="<%=course.getId() %>">
                                        <div class="name-chapter">
                                            <label for="Name-Update">Name Chapter</label>
                                            <input value="<%=chapter.getName()%>" type="text" name="name" id="Name-Update"
                                                   placeholder="Enter name chapter"
                                                   required>
                                        </div>
                                        <div class="ordinal-chapter">
                                            <label for="Ordinal-Update">Ordinal Chapter</label>
                                            <input value="<%=chapter.getOrdinal()%>" type="number" name="ordinal"
                                                   id="Ordinal-Update"
                                                   placeholder="Enter ordinal chapter" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Confirm</button>
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                    </div>
                                </form>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete_<%=chapter.getId()%>">
                        <div class="modal-dialog modal-dialog-centered">
                            <%
                                if(request.getAttribute("course")!=null){
                                    Course course=(Course) request.getAttribute("course");

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
                                    <a href="/dashboard/delete-chapter?id=<%=chapter.getId()%>&courseid=<%=course.getId()%>"
                                       class="btn btn-primary">Yes</a>
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