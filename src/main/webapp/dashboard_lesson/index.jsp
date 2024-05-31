<%@ page import="java.util.List" %>
<%@ page import="model.Lession" %>
<%@ page import="model.Chapter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
<%--    <%@include file="../Component/notify.jsp" %>--%>
    <div class="manage-lessons">
        <div class="manage-lessons__block-title manage-block">
            <div class="manage-title-search">
                <h1 class="manage-lessons__title title">Manage lessons</h1>
                <form action="/dashboard/lessions" method="get" class="search-form">
                    <input type="text" placeholder="Search name user" class="search-input" name="query">
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
                        <form name="form-add" action="/dashboard/create-lession" method="post" class="form-add-lesson"
                              enctype="multipart/form-data">
                            <div class="modal-body">
                                <input name="chapterid" type="text" value="<%=chapter.getId()%>" readonly hidden>
                                <div class="name-lesson">
                                    <label for="Name-Add">Name lesson</label>
                                    <input type="text" name="name" id="Name-Add" placeholder="Enter name lesson"
                                           required>
                                    <span class="error-message" id="nameError-Add"></span>

                                </div>
                                <div class="description-lesson">
                                    <label for="Description-Add">Description lesson</label>
                                    <textarea name="description" id="Description-Add" rows="10"
                                              placeholder="Enter description lesson" required></textarea>
                                </div>
                                <div class="Video-lesson-add">
                                    <label for="FileUpload-Add">Upload new video</label>
                                    <input type="file" name="video" id="FileUpload-Add"
                                           placeholder="Enter video lesson" required>
                                    <span class="error-message" id="videoError-Add"></span>
                                    <video controls width="100%" height="auto" hidden>
                                        <source src="">
                                    </video>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" value="Confirm" class="btn btn-primary">Confirm</button>
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                </div>
                            </div>

                        </form>

                        <%
                            }
                        %>

                        <script>
                            document.querySelector('.form-add-lesson').addEventListener('submit', function(event) {
                                let isValid = true;

                                // Name Courses validation
                                const name = document.getElementById('Name-Add').value.trim();
                                const nameError = document.getElementById('nameError-Add');
                                if (!/^(?=.*[A-Za-z])[A-Za-z0-9\s!@#$%^&*()_+{}\[\]:;<>,.?/~`\-='"|\\]+$/.test(name)) {
                                    nameError.textContent = "Name must contain at least one letter.";
                                    isValid = false;
                                } else {
                                    nameError.textContent = "";
                                }

                                // Image file validation
                                const videoInput = document.getElementById('FileUpload-Add');
                                const videoError = document.getElementById('videoError-Add');
                                const videoFile = videoInput.files[0];

                                if (videoFile) {
                                    const extension = videoFile.name.split('.').pop().toLowerCase();
                                    const allowedExtensions = ['mp4', 'avi', 'mov', 'mkv', 'wmv', 'flv', 'webm'];

                                    if (!allowedExtensions.includes(extension)) {
                                        videoError.textContent = "Only MP4, AVI, MOV, MKV, WMV, FLV, WEBM files are allowed.";
                                        isValid = false;
                                    } else {
                                        videoError.textContent = "";
                                    }
                                } else {
                                    videoError.textContent = "Please select a video file.";
                                    isValid = false;
                                }

                                if (!isValid) {
                                    event.preventDefault();
                                }
                            });
                        </script>

                        <script>
                            document.getElementById('Name-Add').addEventListener('input', function() {
                                let isValid = true;

                                // Name Validation
                                const name = this.value.trim(); // Lấy giá trị của input và loại bỏ khoảng trắng ở đầu và cuối
                                const nameError = document.getElementById('nameError-Add');

                                if (!/^(?=.*[A-Za-z])[A-Za-z0-9\s!@#$%^&*()_+{}\[\]:;<>,.?/~`\-='"|\\]+$/.test(name)) {
                                    nameError.textContent = "Name must contain at least one letter.";
                                    isValid = false;
                                } else {
                                    nameError.textContent = "";
                                }
                            });
                        </script>

                        <script>
                            document.getElementById('FileUpload-Add').addEventListener('change', function() {
                                const videoInput = this;
                                const videoError = document.getElementById('videoError-Add');
                                const videoElement = document.querySelector('.Video-lesson-add video');

                                const videoFile = videoInput.files[0];
                                if (!videoFile) {
                                    videoError.textContent = "Please select a video file.";
                                    videoElement.hidden = true;
                                    return;
                                }

                                const extension = videoFile.name.split('.').pop().toLowerCase();
                                const allowedExtensions = ['mp4', 'avi', 'mov', 'mkv', 'wmv', 'flv', 'webm'];

                                if (!allowedExtensions.includes(extension)) {
                                    videoError.textContent = "Only MP4, AVI, MOV, MKV, WMV, FLV, WEBM files are allowed.";
                                    videoElement.hidden = true;
                                } else {
                                    videoError.textContent = "";
                                    videoElement.src = URL.createObjectURL(videoFile);
                                    videoElement.hidden = false;
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
                                <%
                                    if (request.getAttribute("chapter") != null) {
                                        Chapter chapter = (Chapter) request.getAttribute("chapter");


                                %>
                                <form action="/dashboard/update-lession" method="post" enctype="multipart/form-data" class="form-update-lesson">
                                    <div class="modal-body">
                                        <input type="text" value="<%=l.getId()%>" name="id" hidden="hidden">
                                        <input type="text" value="<%=chapter.getId()%>" name="chapterid" readonly hidden>
                                        <div class="name-lesson">
                                            <label for="Name-Update">Name lesson</label>
                                            <input value="<%=l.getName()%>" type="text" name="name" id="Name-Update"
                                                   placeholder="Enter name lesson" required>
                                            <span class="error-message" id="nameError-Update"></span>

                                        </div>
                                        <div class="description-lesson">
                                            <label for="Description-Update">Description lesson</label>
                                            <textarea name="description" id="Description-Update" rows="10" required
                                                      placeholder="Enter description lesson"><%=l.getDescription()%></textarea>
                                        </div>
                                        <div class="Video-lesson-update">
                                            <label for="FileUpload-Update">Upload new video</label>
                                            <input type="file" name="video" id="FileUpload-Update"
                                                   placeholder="Enter video lesson">
                                            <span class="error-message" id="videoError-Update"></span>
                                            <video controls width="100%" height="auto">
                                                <source src="/images/<%=l.getLink()%>">
                                            </video>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Confirm</button>
                                        <button type="button" class="btn btn-danger"
                                                data-bs-dismiss="modal">No
                                        </button>
                                    </div>
                                </form>
                                <%
                                    }
                                %>
                                <script>
                                    document.querySelector('.form-update-lesson').addEventListener('submit', function(event) {
                                        let isValid = true;

                                        // Name Courses validation
                                        const name = document.getElementById('Name-Update').value.trim();
                                        const nameError = document.getElementById('nameError-Update');
                                        if (!/^(?=.*[A-Za-z])[A-Za-z0-9\s!@#$%^&*()_+{}\[\]:;<>,.?/~`\-='"|\\]+$/.test(name)) {
                                            nameError.textContent = "Name must contain at least one letter.";
                                            isValid = false;
                                        } else {
                                            nameError.textContent = "";
                                        }

                                        Video file validation
                                        const videoInput = document.getElementById('FileUpload-Update');
                                        const videoError = document.getElementById('videoError-Update');
                                        const videoFile = videoInput.files[0];

                                        if (videoFile) {
                                            const extension = videoFile.name.split('.').pop().toLowerCase();
                                            const allowedExtensions = ['mp4', 'avi', 'mov', 'mkv', 'wmv', 'flv', 'webm'];

                                            if (!allowedExtensions.includes(extension)) {
                                                videoError.textContent = "Only MP4, AVI, MOV, MKV, WMV, FLV, WEBM files are allowed.";
                                                isValid = false;
                                            } else {
                                                videoError.textContent = "";
                                            }
                                        } else {
                                            videoError.textContent = "Please select a video file.";
                                            isValid = false;
                                        }

                                        if (!isValid) {
                                            event.preventDefault();
                                        }
                                    });
                                </script>
                                <script>
                                    document.getElementById('Name-Update').addEventListener('input', function() {
                                        let isValid = true;

                                        // Name Validation
                                        const name = this.value.trim(); // Lấy giá trị của input và loại bỏ khoảng trắng ở đầu và cuối
                                        const nameError = document.getElementById('nameError-Update');

                                        if (!/^(?=.*[A-Za-z])[A-Za-z0-9\s!@#$%^&*()_+{}\[\]:;<>,.?/~`\-='"|\\]+$/.test(name)) {
                                            nameError.textContent = "Name must contain at least one letter.";
                                            isValid = false;
                                        } else {
                                            nameError.textContent = "";
                                        }
                                    });
                                </script>
                                <script>
                                    document.getElementById('FileUpload-Update').addEventListener('change', function() {
                                        const videoInput = this;
                                        const videoError = document.getElementById('videoError-Update');
                                        const videoElement = document.querySelector('.Video-lesson-update video');

                                        const videoFile = videoInput.files[0];
                                        if (!videoFile) {
                                            videoError.textContent = "Please select a video file.";
                                            videoElement.style.display = 'none';
                                            return;
                                        }

                                        const extension = videoFile.name.split('.').pop().toLowerCase();
                                        const allowedExtensions = ['mp4', 'avi', 'mov', 'mkv', 'wmv', 'flv', 'webm'];

                                        if (!allowedExtensions.includes(extension)) {
                                            videoError.textContent = "Only MP4, AVI, MOV, MKV, WMV, FLV, WEBM files are allowed.";
                                            videoElement.style.display = 'none';
                                        } else {
                                            videoError.textContent = "";
                                            videoElement.src = URL.createObjectURL(videoFile);
                                            videoElement.style.display = 'block';
                                        }
                                    });
                                </script>
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