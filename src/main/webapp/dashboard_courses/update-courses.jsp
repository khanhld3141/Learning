<%@ page import="model.Course" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp" %>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <h1 class="manage-courses__title title">Update Courses</h1>
        </div>
        <div class="update-courses update-block">
            <form class="update-courses__form update-form" enctype="multipart/form-data" method="post" id="update-courses__form"
                  action="/dashboard/update-course">
            <div class="update-form__content">
                <%
                    if (request.getAttribute("course") != null) {

                        Course course = (Course) request.getAttribute("course");
                        String tech = "";
                        List<User> teachers = (List<User>) request.getAttribute("teachers");
                        for (User user : teachers) {
                            if (user.getId() == course.getTeacherId()) {
                                tech = user.getId() + "-" + user.getName();
                                break;
                            }
                        }
                        List<Category> categories = (List<Category>) request.getAttribute("categories");
                        String cate = "";
                        for (Category category : categories) {
                            if (category.getId() == course.getCateId()) {
                                cate = category.getId() + "-" + category.getName();
                                break;
                            }
                        }
                %>

                <input id="courseid" name="Id" hidden="hidden" value="<%=course.getId()%>"/>
                <div class="name-courses">
                    <label for="Name">Name</label>
                    <input value="<%=course.getName()%>" type="text" name="Name" id="Name"
                           placeholder="Enter name courses"
                           required>
                    <span class="error-message" id="nameError"></span>
                </div>
                <div class="teacher-cate-courses">
                    <div class="teacher-courses">
                        <label for="_TeacherId">Teacher</label>
                        <%--                                <input list="_TeacherId" name="TeacherId" id="TeacherId" placeholder="Choose a teacher" required value="<%=tech%>">--%>
                        <select id="_TeacherId">
                            <%
                                if (request.getAttribute("teachers") != null) {
                                    for (User user : teachers) {
                            %>
                            <option value="<%=user.getId()%>"><%=user.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="cate-courses">
                        <label for="_CateId">Category</label>
                        <%--                            <input list="_CateId" name="CateId" id="CateId" placeholder="Choose a category" required value="<%=cate%>">--%>
                        <select id="_CateId">
                            <%
                                if (request.getAttribute("categories") != null) {

                                    for (Category category : categories) {


                            %>
                            <option value="<%=category.getId()%>"><%=category.getName()%>
                            </option>
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
                              required><%=course.getIntroduce()%></textarea>
                </div>
                <div class="overview-courses">
                    <label for="Overview">Overview</label>
                    <textarea name="Overview" id="Overview" rows="12" placeholder="Enter overview"
                              required><%=course.getOverview()%></textarea>
                </div>
                <div class="result-courses">
                    <label for="Result">Result</label>
                    <textarea name="Result" id="Result" rows="12" placeholder="Enter result"
                              required><%=course.getResult()%></textarea>
                </div>
                <div class="image-price-courses">
                    <div class="price-courses">
                        <label for="Price">Price</label>
                        <input value="<%=course.getPrice()%>" type="number" name="Price" id="Price"
                               placeholder="Enter price courses"
                               required>
                        <span class="error-message" id="priceError"></span>
                    </div>
                    <div class="image-courses">
                        <label for="uploadImage">Image</label>
                        <input type="file" name="Image" id="uploadImage" placeholder="Choose image">
                        <span class="error-message" id="imageError"></span>
                        <img id="image" style="height: 300px; width: 100%; object-fit: cover; border-radius: 20px;
                            margin-top: 12px"
                             src="/images/<%=course.getImage()%>"/>
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="Confirm">
                    <a href="/dashboard/courses" class="btn__back">Back</a>
                </div>
                <%
                    }
                %>
            </div>
            </form>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    function validatePrice() {
                        const priceInput = document.getElementById('Price');
                        const priceError = document.getElementById('priceError');
                        const price = parseFloat(priceInput.value);

                        if (isNaN(price) || price <= 0) {
                            priceError.textContent = "Price must be a number greater than 0.";
                            return false;
                        } else {
                            priceError.textContent = "";
                            return true;
                        }
                    }

                    function validateName() {
                        const name = document.getElementById('Name').value.trim();
                        const nameError = document.getElementById('nameError');

                        if (!/^(?=.*[A-Za-zÀ-Ỹà-ỹĂ-Ếă-ếÂ-Ứâ-ứÊ-Ểê-ểÔ-Ợô-ợƠ-Ỵơ-ỵƯ-Ỵư-ỵ])[A-Za-zÀ-Ỹà-ỹĂ-Ếă-ếÂ-Ứâ-ứÊ-Ểê-ểÔ-Ợô-ợƠ-Ỵơ-ỵƯ-Ỵư-ỵ0-9\s!@#$%^&*()_+{}\[\]:;<>,.?/~`\-='"|\\]+$/.test(name)) {
                            nameError.textContent = "Name must contain at least one letter.";
                            return false;
                        } else {
                            nameError.textContent = "";
                            return true;
                        }
                    }

                    document.getElementById('Name').addEventListener('input', validateName);
                    document.getElementById('Price').addEventListener('input', validatePrice);

                    document.querySelector('.update-courses__form').addEventListener('submit', function(event) {
                        let isValid = true;

                        if (!validateName()) {
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    // $(document).ready(function () {
    //     $('#uploadImage').change(function () {
    //         var formData = new FormData();
    //         formData.append('image', $('#uploadImage')[0].files[0]);
    //         formData.append('id', $("#courseid").val())
    //         $.ajax({
    //             url: '/upload-course',
    //             type: 'POST',
    //             data: formData,
    //             processData: false,
    //             contentType: false,
    //
    //             success: function (response) {
    //
    //                 document.querySelector("#image").src = "/images/" + response;
    //             }
    //         });
    //     });
    // });
    $(document).ready(function () {
        $('#uploadImage').change(function () {
            var formData = new FormData();
            formData.append('image', $('#uploadImage')[0].files[0]);
            formData.append('id', $("#courseid").val())
            $.ajax({
                url: '/upload-course',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,

                success: function (response) {
                    var extension = response.split('.').pop().toLowerCase();
                    var allowedExtensions = ['png', 'jpeg', 'jpg', 'gif', 'svg'];
                    if (allowedExtensions.includes(extension)) {
                        document.querySelector("#image").src = "/images/" + response;
                        $('#image').show();
                        $('#imageError').text("");
                    } else {
                        $('#image').hide();
                        $('#imageError').text("Only PNG, JPEG, GIF, SVG, JPG files are allowed.");
                    }
                },
                error: function () {
                    $('#image').hide();
                    $('#imageError').text("Error occurred while uploading image.");
                }
            });
        });
    });
</script>
<script src="https://cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('Overview');
</script>
</body>
</html>