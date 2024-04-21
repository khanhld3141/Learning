<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>
<div class="content-admin">
    <div class="manage-courses">
        <div class="manage-courses__block-title manage-block">
            <h1 class="manage-courses__title title">Update Courses</h1>
        </div>
        <div class="update-courses update-block">
            <form class="update-courses__form update-form">
                <div class="update-form__content">
                    <div class="name-courses">
                        <label for="Name">Name</label>
                        <input type="text" name="Name" id="Name" placeholder="Enter name courses" required>
                    </div>
                    <div class="teacher-cate-courses">
                        <div class="teacher-courses">
                            <label for="TeacherId">Teacher</label>
                            <input list="_TeacherId" name="TeacherId" id="TeacherId" required>
                            <datalist id="_TeacherId">
                                <option value="Dang Khanh">
                                <option value="Khanh Dang">
                                <option value="Dang Xuan Khanh">
                                <option value="Khanh Xuan Dang">
                            </datalist>
                        </div>
                        <div class="cate-courses">
                            <label for="CateId">Teacher</label>
                            <input list="_CateId" name="CateId" id="CateId" required>
                            <datalist id="_CateId">
                                <option value="Data Science">
                                <option value="Software Engineering">
                                <option value="AI">
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
                    <!-- <div class="update-chapter">
                        <a href="#!" class="btn-manage update-chapter">Update Chapter</a>
                    </div> -->
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="../dashboard_courses" class="btn__back">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>