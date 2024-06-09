<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/9/2024
  Time: 9:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit comment</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <%-- Jquery--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- google-font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <!-- RESET CSS -->
    <link rel="stylesheet" href="../assets/css/reset.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="../Component/component__dashboard.scss">
    <link rel="stylesheet" href="../assets/css/dashboard/dashboard.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/update-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-voucher/manage-voucher.css">
    <link rel="stylesheet" href="../assets/css/dashboard-voucher/add-voucher.css">
    <link rel="stylesheet" href="../assets/css/dashboard-voucher/update-voucher.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/manage-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/update-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard_courses/add-courses.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/manage-chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-lesson/lesson.css">
    <link rel="stylesheet" href="../assets/css/dashboard-lesson/manage-lesson.css">
    <link rel="stylesheet" href="../assets/css/dashboard_category/manage-category.css">
    <link rel="stylesheet" href="../assets/css/dashboard_deposit/manage-deposit.css">
    <link rel="stylesheet" href="../assets/css/dashboard_hashtag/manage-hashtag.css">
    <link rel="stylesheet" href="../assets/css/dashboard_post/manage-post.scss">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="../assets/js/notify/notify.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <link rel="stylesheet" href="../assets/css/notify/validate_error.css">

</head>
<!--------------- MODAL DELETE-------------- -->
<div class="modal fade modal__delete" id="modal__delete_1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body border-0">
                <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                <p>Are you sure you want to delete?</p>
                <p>Deleted data
                    cannot be recovered.</p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">Yes</a>
                <button type="button" class="btn btn-danger"
                        data-bs-dismiss="modal">No
                </button>
            </div>
        </div>
    </div>
</div>

<!-- ------------------------------------->
<body>
    <div class="edit-cmt">
        <div class="edit-cmt-content" style="padding:30px">
            <div class="edit-cmt-head manage-block">
                <h1 class="edit-cmt-title title">EDIT COMMENT</h1>
            </div>
            <div class="update-block edit-cmt-body">
                <label>Comment</label>
                <textarea name="" id="" rows="12" placeholder="New comment" required></textarea>
            </div>
            <div class="submit">
                <input type="submit" value="Confirm">
                <a href="index.jsp" class="btn__back">Back</a>
            </div>
        </div>
    </div>
</body>
</html>
