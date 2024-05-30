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
            <form enctype="multipart/form-data" method="post" action="/dashboard/create-post" id="form-add-post"
                  class="add-posts__form add-form">
                <div class="add-form__content">
                    <div class="title-posts">
                        <label for="Title-post">Title</label>
                        <input type="text" name="title" id="Title-post" placeholder="Enter title post" required>
                    </div>
                    <div class="title-posts">
                        <label for="Image-post">Image</label>
                        <input type="file" name="image" id="Image-post" placeholder="Enter title post" required>
                        <img src="" alt="" id ="preview-picture-post" hidden style="width: 50%; height: 265px; object-fit: cover; border-radius: 18px; margin: 16px 0 6px">
                        <span class = "error-message" id="imagePostError"></span>
                    </div>
                    <div class="Comment-author-posts">
                        <label for="Comment-author-post">Comment author</label>
                        <textarea name="comment" id="Comment-author-post" rows="12" placeholder="Enter comment"
                                  required></textarea>

                    </div>
                    <div class="content-post">
                        <label for="Content-post">Content post</label>
                        <textarea name="Content" id="Content-post" rows="50"
                                  placeholder="Enter content post" required></textarea>

                    </div>
                    <div class="hashtag-list">
                        <div class="hashtag-1">
                            <label for="hashtag-1">Hashtag 1</label>
                            <input type="text" placeholder="Enter hashtag 1" name="hashtag[]" id="hashtag-1">
                            <span class = "error-message" id="hashtagPostError1"></span>

                        </div>
                        <div class="hashtag-2">
                            <label for="hashtag-2">Hashtag 2</label>
                            <input type="text" placeholder="Enter hashtag 2" name="hashtag[]" id="hashtag-2">
                            <span class = "error-message" id="hashtagPostError2"></span>

                        </div>
                        <div class="hashtag-3">
                            <label for="hashtag-3">Hashtag 3</label>
                            <input type="text" placeholder="Enter hashtag 3" name="hashtag[]" id="hashtag-3">
                            <span class = "error-message" id="hashtagPostError3"></span>

                        </div>
                        <div class="hashtag-4">
                            <label for="hashtag-4">Hashtag 4</label>
                            <input type="text" placeholder="Enter hashtag 4" name="hashtag[]" id="hashtag-4">
                            <span class = "error-message" id="hashtagPostError4"></span>

                        </div>
                        <div class="hashtag-5">
                            <label for="hashtag-5">Hashtag 5</label>
                            <input type="text" placeholder="Enter hashtag 5" name="hashtag[]" id="hashtag-5">
                            <span class = "error-message" id="hashtagPostError5"></span>

                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="/dashboard/posts" class="btn__back">Back</a>
                    </div>
                </div>
            </form>

            <script>
                document.getElementById('Image-post').addEventListener('change', function() {
                    var file = this.files[0];
                    var imageType = /image.*/;

                    if (!file.type.match(imageType)) {
                        document.getElementById('imagePostError').innerText = "Only images are allowed!";
                        document.getElementById('preview-picture-post').src = "";
                        document.getElementById('preview-picture-post').hidden = true;
                    } else {
                        var reader = new FileReader();
                        reader.onload = function(e) {
                            document.getElementById('imagePostError').innerText = "";
                            document.getElementById('preview-picture-post').src = e.target.result;
                            document.getElementById('preview-picture-post').hidden = false;
                        }
                        reader.readAsDataURL(file);
                    }
                });
            </script>
            <script>
                var hashtagInputs = document.querySelectorAll('input[name="hashtag[]"]');
                hashtagInputs.forEach(function(input) {
                    input.addEventListener('input', function() {
                        var value = this.value;
                        if (value === "") {
                            this.nextElementSibling.innerText = "";
                            return; // Thoát khỏi hàm nếu giá trị trống
                        }
                        var isValid = /^[a-zA-Z0-9_]+$/.test(value);
                        if (!isValid) {
                            this.nextElementSibling.innerText = "Hashtag must contain only letters, numbers, and underscore!";
                        } else {
                            this.nextElementSibling.innerText = "";
                        }
                    });
                });

            </script>
            <script>
                document.getElementById('form-add-post').addEventListener('submit', function(event) {
                    var errorMessages = document.querySelectorAll('.error-message');
                    var hasError = false;

                    // Check if there are any error messages displayed
                    errorMessages.forEach(function(errorMessage) {
                        if (errorMessage.innerText !== "") {
                            hasError = true;
                        }
                    });

                    // If there are error messages, prevent form submission
                    if (hasError) {
                        event.preventDefault();
                    }
                });

            </script>
        </div>
    </div>
</div>
<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('Content');
</script>
</body>
</html>