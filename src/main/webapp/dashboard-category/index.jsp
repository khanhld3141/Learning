<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<%--<%@include file="../Component/notify.jsp" %>--%>

<div class="content-admin">
    <div class="manage-categories">

        <div class="manage-categories__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-categories__title title">Manage categories</h1>
                <form action="/dashboard/categories" method="get" class="search-form">
                    <input type="text" placeholder="Search name user" class="search-input" name="query">
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
                        <form enctype="multipart/form-data" method="post" class="form-add-category"
                              action="/dashboard/create-category" >
                            <div class="modal-body">
                                <div class="name-category">
                                    <label for="name-category-add">Name Category</label>
                                    <input type="text" name="Name" id="name-category-add"
                                           placeholder="Enter name category" required>
                                    <span class="error-message" id="nameError-add"></span>
                                </div>
                                <div class="image-category">
                                    <label for="image-category-add">Image Category</label>
                                    <input type="file" name="Image" id="image-category-add" required>
                                    <img src="" alt="" id="preview-image" hidden style="width: 150px; height: auto; object-fit: cover; border-radius: 8px; margin-top: 8px">
                                    <span class="error-message" id="imageError-add"></span>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" type="submit">Confirm</button>
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                </div>
                            </div>
                        </form>
                        <script>
                            document.getElementById('name-category-add').addEventListener('input', function() {
                                const name = this.value.trim();
                                const nameError = document.getElementById('nameError-add');
                                // const regex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;
                                const regex = /^[A-Za-zÀ-ỹ\s]+$/u;
                                if (name.length < 5 || !regex.test(name)) {
                                    nameError.textContent = "Name must contain at least 5 alphabetic characters and can't contain numbers";
                                } else {
                                    nameError.textContent = "";
                                }
                            });
                        </script>
                        <script>
                            document.getElementById('image-category-add').addEventListener('change', function(event) {
                                const imageInput = event.target;
                                const imageFile = imageInput.files[0];
                                const previewImage = document.getElementById('preview-image');
                                const imageError = document.getElementById('imageError-add');
                                const allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg', 'bmp'];

                                if (imageFile) {
                                    const extension = imageFile.name.split('.').pop().toLowerCase();

                                    if (allowedExtensions.includes(extension)) {
                                        const reader = new FileReader();
                                        reader.onload = function(e) {
                                            previewImage.src = e.target.result;
                                            previewImage.hidden = false;
                                            imageError.textContent = ""; // Clear any previous error messages
                                        }
                                        reader.readAsDataURL(imageFile);
                                    } else {
                                        previewImage.hidden = true;
                                        previewImage.src = "";
                                        imageError.textContent = "Only PNG, JPEG, JPG, GIF, SVG, BMP files are allowed.";
                                    }
                                } else {
                                    previewImage.hidden = true;
                                    previewImage.src = "";
                                    imageError.textContent = "Please select an image file.";
                                }
                            });
                        </script>
                        <script>
                            document.querySelector('.form-add-category').addEventListener('submit', function(event) {
                                let isValid = true;

                                // Name validation
                                const name = document.getElementById('name-category-add').value.trim();
                                const nameError = document.getElementById('nameError-add');
                                const nameRegex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;

                                if (name.length < 5 || !nameRegex.test(name)) {
                                    nameError.textContent = "Name must contain at least 5 alphabetic characters and can't contain numbers.";
                                    isValid = false;
                                } else {
                                    nameError.textContent = "";
                                }

                                // Image file validation
                                const imageInput = document.getElementById('image-category-add');
                                const imageError = document.getElementById('imageError-add');
                                const imageFile = imageInput.files[0];
                                const previewImage = document.getElementById('preview-image');
                                const allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg', 'bmp'];

                                if (imageFile) {
                                    const extension = imageFile.name.split('.').pop().toLowerCase();

                                    if (!allowedExtensions.includes(extension)) {
                                        imageError.textContent = "Only PNG, JPEG, JPG, GIF, SVG, BMP files are allowed.";
                                        previewImage.hidden = true;
                                        isValid = false;
                                    } else {
                                        imageError.textContent = "";
                                        const reader = new FileReader();
                                        reader.onload = function(e) {
                                            previewImage.src = e.target.result;
                                            previewImage.hidden = false;
                                        }
                                        reader.readAsDataURL(imageFile);
                                    }
                                } else {
                                    imageError.textContent = "Please select an image file.";
                                    previewImage.hidden = true;
                                    isValid = false;
                                }

                                if (!isValid) {
                                    event.preventDefault();
                                }
                            });
                        </script>
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
                        <img src="/images/<%=category.getImage()%>" alt="category-image" style="width: 100px; height: 40px; object-fit: cover; border-radius: 5px">
                    </td>
                    <td>
                        <!-- BUTTON TRIGGER UPDATE MODAL  -->
                        <button type="button" class="btn__modal" data-bs-toggle="modal"
                                data-bs-target="#modal__update-category_<%=category.getId()%>" style="border: none;"
                                title="Edit category">
                            <i class="fa-solid fa-pen"></i>
                        </button>
                        <!--------------- MODAL UPDATE Category-------------- -->
                        <div class="modal fade modal__update" id="modal__update-category_<%=category.getId()%>" class="form-update-category">
                            <div class="modal-dialog modal-dialog-centered">
                                <form action="/dashboard/update-category" method="post" enctype="multipart/form-data" class="modal-content form-update-category">
                                    <div class="modal-header">
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="name-category">
                                            <input id="cateid" name="id" value="<%=category.getId()%>" hidden="hidden"/>
                                            <label for="name-category-update">Name Category</label>
                                            <input value="<%=category.getName()%>" type="text" name="name" id="name-category-update" placeholder="Enter name category" required>
                                            <span class="error-message" id="nameError-update"></span>
                                            <div class="image-category">
                                                <label for="uploadImage">Image Category</label>
                                                <input type="file" name="image" id="uploadImage" placeholder="Enter name category">
                                                <span class="error-message" id="imageError-update"></span>
                                                <img id="image" src="/images/<%=category.getImage()%>" style="width: 120px; height: 80px; border-radius: 10px; object-fit: cover; margin-top: 15px">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-primary" type="submit">Confirm</button>
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                    </div>
                                </form>

                                <script>
                                    document.getElementById('name-category-update').addEventListener('input', function() {
                                        const name = this.value.trim();
                                        const nameError = document.getElementById('nameError-update');
                                        // const regex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;
                                        const regex = /^[A-Za-zÀ-ỹ\s]+$/u;
                                        if (name.length < 5 || !regex.test(name)) {
                                            nameError.textContent = "Name must contain at least 5 alphabetic characters and can't contain numbers";
                                        } else {
                                            nameError.textContent = "";
                                        }
                                    });

                                    document.getElementById('uploadImage').addEventListener('change', function(event) {
                                        const imageInput = event.target;
                                        const imageFile = imageInput.files[0];
                                        const previewImage = document.getElementById('image');
                                        const imageError = document.getElementById('imageError-update');
                                        const allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg', 'bmp'];

                                        if (imageFile) {
                                            const extension = imageFile.name.split('.').pop().toLowerCase();

                                            if (!allowedExtensions.includes(extension)) {
                                                imageError.textContent = "Only PNG, JPEG, JPG, GIF, SVG, BMP files are allowed.";
                                                previewImage.hidden = true;
                                                previewImage.src = "";
                                            } else {
                                                imageError.textContent = "";
                                                const reader = new FileReader();
                                                reader.onload = function(e) {
                                                    previewImage.src = e.target.result;
                                                    previewImage.hidden = false;
                                                }
                                                reader.readAsDataURL(imageFile);
                                            }
                                        } else {
                                            imageError.textContent = "Please select an image file.";
                                            previewImage.hidden = true;
                                            previewImage.src = "";
                                        }
                                    });
                                </script>
                                <script>
                                    document.querySelector('.form-update-category').addEventListener('submit', function(event) {
                                        let isValid = true;

                                        // Name validation
                                        const name = document.getElementById('name-category-update').value.trim();
                                        const nameError = document.getElementById('nameError-update');
                                        const nameRegex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;

                                        if (name.length < 5 || !nameRegex.test(name)) {
                                            nameError.textContent = "Name must contain at least 5 alphabetic characters and can't contain numbers.";
                                            isValid = false;
                                        } else {
                                            nameError.textContent = "";
                                        }

                                        // Image file validation
                                        // const imageInput = document.getElementById('uploadImage');
                                        // const imageError = document.getElementById('imageError-update');
                                        // const imageFile = imageInput.files[0];
                                        // const previewImage = document.getElementById('image');
                                        // const allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg', 'bmp'];
                                        //
                                        // if (imageFile) {
                                        //     const extension = imageFile.name.split('.').pop().toLowerCase();
                                        //
                                        //     if (!allowedExtensions.includes(extension)) {
                                        //         imageError.textContent = "Only PNG, JPEG, JPG, GIF, SVG, BMP files are allowed.";
                                        //         previewImage.hidden = true;
                                        //         isValid = false;
                                        //     } else {
                                        //         imageError.textContent = "";
                                        //         const reader = new FileReader();
                                        //         reader.onload = function(e) {
                                        //             previewImage.src = e.target.result;
                                        //             previewImage.hidden = false;
                                        //         }
                                        //         reader.readAsDataURL(imageFile);
                                        //     }
                                        // } else {
                                        //     imageError.textContent = "Please select an image file.";
                                        //     previewImage.hidden = true;
                                        //     isValid = false;
                                        // }

                                        if (!isValid) {
                                            event.preventDefault();
                                        }
                                    });
                                </script>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#uploadImage').change(function() {
            var imageInput = $('#uploadImage')[0];
            var imageFile = imageInput.files[0];
            var imageError = document.getElementById('imageError-update');
            var previewImage = document.getElementById('image');
            var allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg', 'bmp'];

            if (imageFile) {
                var extension = imageFile.name.split('.').pop().toLowerCase();

                if (!allowedExtensions.includes(extension)) {
                    imageError.textContent = "Only PNG, JPEG, JPG, GIF, SVG, BMP files are allowed.";
                    previewImage.hidden = true;
                    previewImage.src = "";
                } else {
                    imageError.textContent = "";
                    var formData = new FormData();
                    formData.append('image', imageFile);
                    formData.append('id', $("#cateid").val());

                    $.ajax({
                        url: '/upload-category',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            previewImage.src = "/images/" + response;
                            previewImage.hidden = false;
                        }
                    });
                }
            } else {
                imageError.textContent = "Please select an image file.";
                previewImage.hidden = true;
                previewImage.src = "";
            }
        });

        $('#name-category-update').on('input', function() {
            const name = this.value.trim();
            const nameError = document.getElementById('nameError-update');
            const regex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;
            if (name.length < 5 || !regex.test(name)) {
                nameError.textContent = "Name must contain at least 5 alphabetic characters and can't contain numbers";
            } else {
                nameError.textContent = "";
            }
        });
    });
</script>
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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script type="text/javascript">
    function showToast(message, type) {
        let backgroundColor, className;
        if (type === "1") {
            backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
            className = "success"
        } else if (type === "0") {
            backgroundColor = "linear-gradient(to right, #ff5f6d, #ffc371)";
            className = "error"
        }

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "bottom",
            position: "right",
            backgroundColor: backgroundColor,
            stopOnFocus: true,
            className: className,

        }).showToast();
    }

    <%
        if (session.getAttribute("success")!=null) {
    %>
    showToast("<%= session.getAttribute("success") %>", "1");
    <%
    session.setAttribute("success",null);
      }
    %>

    <%

      if (session.getAttribute("error")!=null) {
  %>
    showToast("<%= session.getAttribute("error") %>", "0");
    <%
    session.setAttribute("error",null);
      }
    %>
</script>
</body>
</html>