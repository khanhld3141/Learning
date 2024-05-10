<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-posts">
        <div class="manage-posts__block-title manage-block">
            <h1 class="manage-posts__title title">Add New Post</h1>
        </div>
        <div class="add-posts add-block">
            <form enctype="multipart/form-data" method="post" action="/dashboard/create-post"
                  class="add-posts__form add-form">
                <div class="add-form__content">
                    <div class="author-post">
                        <label for="UserId">Author</label>
                        <input list="_UserId" name="author" id="UserId" placeholder="Choose a author" required>
                        <datalist id="_UserId">
                            <%
                                if (request.getAttribute("users") != null) {
                                    List<User> users=(List<User>) request.getAttribute("users");
                                    for (User user : users) {
                            %>
                            <option value=<%=user.getId() + "-" +user.getName()%>>
                                    <%
                                        }
                                    }
                                %>
                        </datalist>
                    </div>
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
                        <textarea name="Content" id="Content-post" rows="50"
                                  placeholder="Enter content post"></textarea>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="../dashboard/posts" class="btn__back">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('Content');
</script>
</body>
</html>