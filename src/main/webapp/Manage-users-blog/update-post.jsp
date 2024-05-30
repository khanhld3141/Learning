<%@ page import="model.Post" %>
<%@ page import="model.Hashtag" %>
<%@ page import="java.util.List" %>
<%@include file="../Component/header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/add-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.css">
    <link rel="stylesheet" href="../assets/css/Blog-user/post-user.scss">
    <link rel="stylesheet" href="../assets/css/dashboard_post/manage-post.scss">


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
                                <span class = "error-message" id="imageError"></span>
                                <img src="/images/<%=post.getImage()%>" id="image" style="width: 50%; height: 265px; object-fit: cover; border-radius: 18px; margin: 16px 0 6px;">
                            </div>
                            <div class="Comment-author-posts">
                                <label for="Comment-author-post">Comment author</label>
                                <textarea name="comment" id="Comment-author-post" rows="12" placeholder="Enter comment"
                                          required><%=post.getComment()%></textarea>
                            </div>
                            <div class="content-post">
                                <label for="Content-post">Content post</label>
                                <textarea name="content" id="Content-post" rows="50"
                                          placeholder="Enter content post" required><%=post.getContent()%></textarea>
                            </div>
                            <div class="hashtag-list">
                                <%
                                    if (request.getAttribute("hashtags") != null) {

                                        List<Hashtag> hashtags = (List<Hashtag>) request.getAttribute("hashtags");

                                        for (int i = 0; i < 5; i++) {
                                            if (i < hashtags.size()) {


                                %>
                                <div class="hashtag-<%= i+1 %>">
                                    <label for="hashtag-<%= i+1 %>">Hashtag <%= i + 1 %>
                                    </label>
                                    <input type="text" placeholder="Enter hashtag <%= i+1 %>" name="hashtag[]"
                                           id="hashtag-<%= i+1 %>" value="<%= hashtags.get(i).getTag() %>">
                                </div>
                                <%
                                } else {

                                %>
                                <div class="hashtag-<%= i+1 %>">
                                    <label for="hashtag-<%= i+1 %>">Hashtag <%= i + 1 %>
                                    </label>
                                    <input type="text" placeholder="Enter hashtag <%= i+1 %>" name="hashtag[]"
                                           id="hashtag-<%= i+1 %>">
                                </div>
                                <%
                                            }
                                        }

                                    }
                                %>
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
                    var file = this.files[0];
                    var formData = new FormData();
                    formData.append('image', file);
                    formData.append('postid', $('#postid').val());

                    // Kiểm tra định dạng ảnh
                    if (!file.type.match('image.*')) {
                        $('#image').hide();
                        $('#imageError').text("Please select an image file.");
                        return;
                    }
                    $.ajax({
                        url: '/upload-image-blog',
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,

                        success: function(response){
                            $('#image').show();
                            $('#imageError').text("");
                            location.reload();
                        }
                    });
                });
            });
        </script>


    </div>
</main>
<%@include file="../Component/footer.jsp"%>
