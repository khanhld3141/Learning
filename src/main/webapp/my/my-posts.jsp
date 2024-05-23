<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<%@include file="../Component/notify.jsp" %>

<main>
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/manage-chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/update-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">

    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp" %>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="courses-participated">
                        <div class="block-1">
                            <h2 class="profile-right__title">My posts</h2>
                            <a href="/create-my-post" class="btn btn__add-new-post-profile" style="background: #0c2e60; width: 150px; margin-bottom: 0">Add new
                                post</a>
                        </div>
                        <div class="table">
                            <table class="courses-participated-table" id="table-sort">
                                <thead>
                                <tr>
                                    <th onclick="sortTable(0)">ID Posts</th>
                                    <th onclick="sortTable(1)">Title</th>
                                    <th onclick="sortTable(2)">Image</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (request.getAttribute("posts") != null) {
                                        List<Post> posts = (List<Post>) request.getAttribute("posts");
                                        for (Post post : posts) {
                                %>
                                <tr style="align-items: center" onclick="redirectToAnchor(this)">
                                    <%-- bỏ link của mỗi bài viết ở thẻ a dưới đây (nằm trong thẻ td chứa id) là được--%>
                                    <td><a href="/detail-blog?id=<%=post.getId()%>"><%=post.getId()%>
                                    </a></td>
                                    <td><%=post.getTitle()%>
                                    </></td>
                                    <td>
                                        <img style="width: 100px;height: 40px;object-fit: cover; border-radius: 4px" src="/images/<%=post.getImage()%>">
                                    </td>
                                    <td>
                                        <a href="/update-my-post?id=<%=post.getId()%>" title="Edit this post"
                                           style="margin-right: 3px ; color: #ffb800"><i class="fa-solid fa-marker"></i></a>
                                        <button type="button" data-bs-toggle="modal"
                                                class="edit-blogs-user"
                                                data-bs-target="#modal__delete_<%=post.getId()%>"
                                                title="Delete this blog"
                                                style="margin-right: 14px;color: #ffb800; border: none">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </td>
                                    <div class="modal fade modal__delete" id="modal__delete_<%=post.getId()%>">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal"></button>
                                                </div>

                                                <div class="modal-body border-0">
                                                    <span><i class="fa-solid fa-triangle-exclamation"></i></span>
                                                    <p>Are you sure you want to delete?</p>
                                                    <p>Deleted data
                                                        cannot be recovered.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="/delete-my-post?id=<%=post.getId()%>"
                                                       class="btn-primary btn__edit-delete-comment-yes">Yes</a>
                                                    <button type="button" class="btn-danger btn__edit-delete-comment-no"
                                                            data-bs-dismiss="modal">No
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                </tbody>
                                <script>
                                    function redirectToAnchor(row) {
                                        var anchor = row.querySelector('a');
                                        if (anchor) {
                                            window.location.href = anchor.href;
                                        }
                                    }
                                </script>
                                <script src="../assets/js/Sort_table/sort-table.js"></script>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>