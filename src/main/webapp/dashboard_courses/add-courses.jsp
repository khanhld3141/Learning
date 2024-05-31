<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <h1 class="manage-courses__title title">Add New Courses</h1>
        </div>
        <div class="add-courses add-block">
            <form class="add-courses__form add-form" enctype="multipart/form-data" method="post" id="add-courses__form"
                  action="/dashboard/create-course">
                <div class="add-form__content">
                    <div class="name-courses">
                        <label for="Name">Name</label>
                        <input type="text" name="Name" id="Name" placeholder="Enter name courses" required>
                        <span class="error-message" id="nameError"></span>
                    </div>
                    <div class="teacher-cate-courses">
                        <div class="teacher-courses">
                            <label for="_TeacherId">Teacher</label>
                            <%--                            <input list="_TeacherId" name="TeacherId" id="TeacherId" placeholder="Choose a teacher" required>--%>
                            <select name="TeacherId" id="_TeacherId">
                                <%
                                    if (request.getAttribute("teachers") != null) {
                                        List<User> teachers = (List<User>) request.getAttribute("teachers");
                                        for (User user : teachers) { %>
                                <option value="<%=user.getId()%>"><%=user.getName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="cate-courses">
                            <label for="_CateId">Category</label>
<%--                            <input list="_CateId" name="CateId" id="CateId" placeholder="Choose a category" required>--%>
                            <select id="_CateId" name="CateId">
                                <%
                                    if (request.getAttribute("categories") != null) {
                                        List<Category> categories = (List<Category>) request.getAttribute("categories");
                                        for (Category category : categories) {


                                %>
                                <option value="<%=category.getId()%>"><%=category.getName()%></option>
                                        <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="introduce-courses">
                        <label for="Introduce">Introduce</label>
                        <textarea name="Introduce" id="Introduce" rows="12" placeholder="Enter introduce"
                                  required></textarea>
                    </div>
                    <div class="overview-courses">
                        <label for="Overview">Overview</label>
                        <textarea name="Overview" id="Overview" rows="12" placeholder="Enter overview"
                                  required></textarea>
                    </div>
                    <div class="result-courses">
                        <label for="Result">Result</label>
                        <textarea name="Result" id="Result" rows="12" placeholder="Enter result"
                                  required></textarea>
                    </div>
                    <div class="image-price-courses">
                        <div class="price-courses">
                            <label for="Price">Price</label>
                            <input type="number" name="Price" id="Price" placeholder="Enter price courses" required>
                            <span class="error-message" id="priceError"></span>
                        </div>
                        <div class="image-courses">
                            <label for="Image">Image</label>
                            <input type="file" name="Image" id="Image" placeholder="Choose image" required>
                            <img src="" alt="" id="previewImage" style="width: 100%; height: auto; object-fit: cover; border-radius: 10px" hidden>
                            <span class="error-message" id="imageError"></span>
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="/dashboard/courses" class="btn__back">Back</a>
                    </div>
                </div>
            </form>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const nameInput = document.getElementById('Name');
                    const imageInput = document.getElementById('Image');
                    const priceInput = document.getElementById('Price'); // Thêm dòng này
                    const previewImage = document.getElementById('previewImage');
                    const priceError = document.getElementById('priceError'); // Thêm dòng này

                    function validateName() {
                        const name = nameInput.value.trim();
                        const nameError = document.getElementById('nameError');
                        if (!/^(?=.*[A-Za-zÀ-Ỹà-ỹĂ-Ếă-ếÂ-Ứâ-ứÊ-Ểê-ểÔ-Ợô-ợƠ-Ỵơ-ỵƯ-Ỵư-ỵ])[A-Za-zÀ-Ỹà-ỹĂ-Ếă-ếÂ-Ứâ-ứÊ-Ểê-ểÔ-Ợô-ợƠ-Ỵơ-ỵƯ-Ỵư-ỵ0-9\s!@#$%^&*()_+{}\[\]:;<>,.?/~`\-='"|\\]+$/.test(name)) {
                            nameError.textContent = "Name must contain at least one letter.";
                            return false;
                        } else {
                            nameError.textContent = "";
                            return true;
                        }
                    }

                    function validateImage() {
                        const imageError = document.getElementById('imageError');
                        const imageFile = imageInput.files[0];

                        if (imageFile) {
                            const extension = imageFile.name.split('.').pop().toLowerCase();
                            const allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg'];

                            if (!allowedExtensions.includes(extension)) {
                                imageError.textContent = "Only PNG, JPEG, GIF, SVG, JPG files are allowed.";
                                return false;
                            } else {
                                imageError.textContent = "";
                                return true;
                            }
                        } else {
                            imageError.textContent = "Please select an image file.";
                            return false;
                        }
                    }

                    function validatePrice() {
                        const price = parseFloat(priceInput.value);

                        if (isNaN(price) || price <= 0) {
                            priceError.textContent = "Price must be a number greater than 0.";
                            return false;
                        } else {
                            priceError.textContent = "";
                            return true;
                        }
                    }

                    function previewSelectedImage() {
                        const imageFile = imageInput.files[0];
                        if (imageFile) {
                            const reader = new FileReader();
                            reader.onload = function(e) {
                                previewImage.src = e.target.result;
                                previewImage.hidden = false;
                            }
                            reader.readAsDataURL(imageFile);
                        } else {
                            previewImage.hidden = true;
                        }
                    }

                    nameInput.addEventListener('input', validateName);
                    imageInput.addEventListener('input', function() {
                        validateImage();
                        previewSelectedImage();
                    });
                    priceInput.addEventListener('input', validatePrice); // Thêm dòng này

                    document.querySelector('.add-courses__form').addEventListener('submit', function(event) {
                        let isValid = true;

                        if (!validateName()) {
                            isValid = false;
                        }

                        if (!validateImage()) {
                            isValid = false;
                        }

                        if (!validatePrice()) {
                            isValid = false;
                        }

                        if (!isValid) {
                            event.preventDefault();
                        }
                    });
                });

            </script>

        </div>
    </div>
</div>
<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('Overview');
</script>
</body>
</html>