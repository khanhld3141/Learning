<%@include file="../Component/header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.scss">
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/add-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.scss">
    <link rel="stylesheet" href="../assets/css/Blog-user/post-user.scss">
    <div class="main-content">
        <div class="content-admin">
            <div class="manage-posts">
                <div class="manage-posts__block-title manage-block">
                    <h1 class="manage-posts__title title">Add New Post</h1>
                </div>
                <div class="add-posts add-block">
                    <form
                            action="/create-my-post"
                            method="post"
                            enctype="multipart/form-data"
                          class="add-posts__form add-form">
                        <div class="add-form__content">
                            <div class="title-posts">
                                <label for="Title-post">Title</label>
                                <input type="text" name="title" id="Title-post" placeholder="Enter title post" required>
                            </div>
                            <div class="title-posts">
                                <label for="Image-post">Image</label>
                                <input type="file" name="image" id="Image-post" placeholder="Enter title post" required>
                            </div>
                            <div class="Comment-author-posts">
                                <label for="Comment-author-post">Comment author</label>
                                <textarea name="comment" id="Comment-author-post" rows="12" placeholder="Enter comment"
                                          required></textarea>
                            </div>
                            <div class="content-post">
                                <label for="Content-post">Content post</label>
                                <textarea name="content" id="Content-post" rows="50"
                                          placeholder="Enter content post"></textarea>
                            </div>
                            <div class="submit">
                                <input type="submit" value="Confirm">
                                <a href="/blogs" class="btn__back">Back</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
        <script>
            CKEDITOR.replace('content');
        </script>
    </div>
</main>
<%@include file="../Component/footer.jsp"%>
