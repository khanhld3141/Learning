<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
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
                        <form enctype="multipart/form-data" method="post"
                              action="/dashboard/create-category" >
                            <div class="modal-body">
                                <div class="name-category">
                                    <label for="name-category-add">Name Category</label>
                                    <input type="text" name="Name" id="name-category-add"
                                           placeholder="Enter name category">
                                </div>
                                <div class="name-category">
                                    <label for="image-category-add">Image Category</label>
                                    <input type="file" name="Image" id="image-category-add">
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" type="submit">Confirm</button>
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </form>
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
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(request.getAttribute("categories") != null){
                        List<Category> categories= (List<Category>) request.getAttribute("categories");

                        for(Category category : categories){

                %>
                <tr>
                    <td><%=category.getId()%></td>
                    <td><%=category.getName()%></td>
                    <td>
                        <img src="/images/<%=category.getImage()%>"/>
                    </td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-category_<%=category.getId()%>" style="border: none;"
                                title="Edit category">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!--------------- MODAL UPDATE CHAPTER-------------- -->
                        <div class="modal fade modal__update" id="modal__update-category_<%=category.getId()%>">
                            <div class="modal-dialog modal-dialog-centered">
                                <form action="/dashboard/update-category" method="post" enctype="multipart/form-data" class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="btn-close"
                                                data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="name-category">
                                            <input name="id" value="<%=category.getId()%>" hidden="hidden"/>
                                            <label for="name-category-update">Name Category</label>
                                            <input VALUE="<%=category.getName()%>" type="text" name="name"
                                                   id="name-category-update"
                                                   placeholder="Enter name category">
                                            <div class="name-category">
                                                <label for="image-category-update">Image Category</label>
                                                <input type="file" name="image" id="image-category-update"
                                                       placeholder="Enter name category">
                                            </div>
                                            <img src="/images/<%=category.getImage()%>" style="width: 120px; height: 80px; border-radius: 10px; object-fit: cover; margin-top: 15px">
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


                        <!-- BUTTON TRIGGER DELETE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__delete-category_<%=category.getId()%>" title="Delete category">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </td>
                    <!--------------- MODAL DELETE---------------------------- -->
                    <div class="modal fade modal__delete" id="modal__delete-category_<%=category.getId()%>">
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
                                    <a href="/dashboard/delete-category?id=<%=category.getId()%>" class="btn btn-primary">
                                        Yes</a>
                                    <button type="button" class="btn btn-danger"
                                            data-bs-dismiss="modal">No
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ------------------------------------------------->
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
        </div>
    </div>
</div>
<script>
    function previousPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var previousPage = currentPage - 1;
        if (previousPage >= 1) {
            window.location.href = "/dashboard/categories?page=" + previousPage;
        }
    }

    function nextPage() {
        var currentPage = <%= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1 %>;
        var nextPage = currentPage + 1;
        window.location.href = "/dashboard/categories?page=" + nextPage;
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