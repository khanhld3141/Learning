<%@ page import="model.Post" %>
<%@include file="../Component/header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/add-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.scss">
    <link rel="stylesheet" href="../assets/css/Blog-user/post-user.scss">

    <div class="main-content">
        <div class="content-admin">
            <div class="manage-posts">
                <div class="manage-posts__block-title manage-block">
                    <h1 class="manage-posts__title title">Update your post</h1>
                </div>
                <div class="add-posts add-block">
                    <%
                        if(request.getAttribute("post")!=null){
                            Post post=(Post)request.getAttribute("post");
                    %>
                    <form action="/update-my-post" method="post"
                            class="add-posts__form add-form">
                        <div class="add-form__content">
                            <input value="<%=post.getId()%>" name="id" hidden="hidden" id="postid">
                            <div class="title-posts">
                                <label for="Title-post">Title</label>
                                <input value="<%=post.getTitle()%>" type="text" name="title" id="Title-post"
                                       placeholder="Enter title post"
                                        required>
                            </div>
                            <div class="title-posts">
                                <label for="Image-post">Image</label>
                                <input type="file" id="Image-post" placeholder="Enter title post">
                                <img style="width: 100%" src="/images/<%=post.getImage()%>">
                            </div>
                            <div class="Comment-author-posts">
                                <label for="Comment-author-post">Comment author</label>
                                <textarea name="comment" id="Comment-author-post" rows="12" placeholder="Enter comment"
                                          required><%=post.getComment()%></textarea>
                            </div>
                            <div class="content-post">
                                <label for="Content-post">Content post</label>
                                <textarea name="content" id="Content-post" rows="50"
                                          placeholder="Enter content post"><%=post.getContent()%></textarea>
                            </div>
                            <div class="submit">
                                <input type="submit" value="Confirm">
                                <a href="/my-posts" class="btn__back">Back</a>
                            </div>
                        </div>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
        <script>
            CKEDITOR.replace('content');
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function(){
                $('#Image-post').change(function(){
                    var formData = new FormData();
                    formData.append('image', $('#Image-post')[0].files[0]);
                    formData.append('postid', $('#postid').val())
                    $.ajax({
                        url: '/upload-image-blog',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,

                        success: function(response){
                           location.reload();
                        }
                    });
                });
            });
        </script>

    </div>
</main>
<%@include file="../Component/footer.jsp"%>
