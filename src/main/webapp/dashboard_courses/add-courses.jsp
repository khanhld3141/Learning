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
            <form class="add-courses__form add-form" enctype="multipart/form-data" method="post"
                  action="/dashboard/create-course">
               <div class="add-form__content">
                    <div class="name-courses">
                        <label for="Name">Name</label>
                        <input type="text" name="Name" id="Name" placeholder="Enter name courses" required>
                    </div>
                    <div class="teacher-cate-courses">
                        <div class="teacher-courses">
                            <label for="TeacherId">Teacher</label>
                            <input list="_TeacherId" name="TeacherId" id="TeacherId" placeholder="Choose a teacher" required>
                            <datalist id="_TeacherId">
                                <%
                                    if (request.getAttribute("teachers") != null) {
                                        List<User> teachers = (List<User>) request.getAttribute("teachers");
                                        for (User user : teachers) {


                                %>
                                <option value=<%=user.getId() + "-" +user.getName()%>>
                                        <%
                                        }
                                    }
                                %>
                            </datalist>
                        </div>
                        <div class="cate-courses">
                            <label for="CateId">Category</label>
                            <input list="_CateId" name="CateId" id="CateId" placeholder="Choose a category" required>
                            <datalist id="_CateId">
                                <%
                                    if (request.getAttribute("categories") != null) {
                                        List<Category> categories = (List<Category>) request.getAttribute("categories");
                                        for (Category category : categories) {


                                %>
                                <option value=<%=category.getId() + "-" +category.getName()%>>
                                        <%
                                        }
                                    }
                                %>
                            </datalist>
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
                        </div>
                        <div class="image-courses">
                            <label for="Image">Image</label>
                            <input type="file" name="Image" id="Image" placeholder="Choose image" required>
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="/dashboard/courses" class="btn__back">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>