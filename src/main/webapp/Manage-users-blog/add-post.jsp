<%@include file="../Component/header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.scss">
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/add-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.css">
    <link rel="stylesheet" href="../assets/css/Blog-user/post-user.scss">
    <link rel="stylesheet" href="../assets/css/dashboard_post/manage-post.scss">
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
                            <div class="hashtag-list">
                                <div class="hashtag-1">
                                    <label for="hashtag-1">Hashtag 1</label>
                                    <input type="text" placeholder="Enter hashtag 1" name="hashtag[]" id="hashtag-1">
                                </div>
                                <div class="hashtag-2">
                                    <label for="hashtag-2">Hashtag 2</label>
                                    <input type="text" placeholder="Enter hashtag 2" name="hashtag[]" id="hashtag-2">
                                </div>
                                <div class="hashtag-3">
                                    <label for="hashtag-3">Hashtag 3</label>
                                    <input type="text" placeholder="Enter hashtag 3" name="hashtag[]" id="hashtag-3">
                                </div>
                                <div class="hashtag-4">
                                    <label for="hashtag-4">Hashtag 4</label>
                                    <input type="text" placeholder="Enter hashtag 4" name="hashtag[]" id="hashtag-4">
                                </div>
                                <div class="hashtag-5">
                                    <label for="hashtag-5">Hashtag 5</label>
                                    <input type="text" placeholder="Enter hashtag 5" name="hashtag[]" id="hashtag-5">
                                </div>

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
