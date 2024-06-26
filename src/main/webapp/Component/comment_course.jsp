<%@ page import="model.PostComment" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>


<%
    if (request.getAttribute("comments") != null) {
        List<CourseComment> comments = (List<CourseComment>) request.getAttribute("comments");
        for (CourseComment comment : comments) {

%>
<div class="comment__item">
    <img src="/images/<%=comment.getAuthor().getAvatar()%>" alt="Avatar-user" class="comment__avt">
    <div class="comment__user">
        <div class="threedots-block">
            <p class="comment__user-name"><%=comment.getAuthor().getName()%>
            </p>
            <div class="action-cmt__block">
                <i class="fa-solid fa-ellipsis" title="Edit or delete this">
                </i>
                <%
                    if (session.getAttribute("user") != null) {
                        User user = (User) session.getAttribute("user");
                        if (user.getId() == comment.getAuthorId()) {


                %>
                <div class="edit-delete-comment-block display-none">
                    <button type="button" data-bs-toggle="modal"
                            class="button-edit-delete-comment"
                            data-bs-target="#modal__update-commment_<%=comment.getId()%>" title="Delete comment">
                        Edit
                    </button>
                    <button type="button" data-bs-toggle="modal"
                            class="button-edit-delete-comment" data-bs-target="#modal__delete_<%=comment.getId()%>"
                            title="Delete comment">
                        Delete
                    </button>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <!-- MODAL DELETE COMMENT -->
        <div class="modal fade modal__delete" id="modal__delete_<%=comment.getId()%>">
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
                        <a href="/delete-comment-of-course?courseid=<%=course.getId()%>&id=<%=comment.getId()%>"
                           class="btn-primary btn__edit-delete-comment-yes">Yes</a>
                        <button type="button" class="btn-danger btn__edit-delete-comment-no"
                                data-bs-dismiss="modal">No
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--------------------------------------->
        <!-- MODAL UPDATE COMMENT -->
        <div class="modal fade modal__update" id="modal__update-commment_<%=comment.getId()%>">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close"
                                data-bs-dismiss="modal"></button>
                    </div>
                    <form action="/update-comment-of-course" method="post">
                        <input name="courseid" value="<%=course.getId()%>" hidden="hidden">
                        <input name="id" value="<%=comment.getId()%>" hidden="hidden"   >
                        <div class="modal-body">
                            <div class="Content-comment">
                                <label for="Content-comment">Content comment</label>
                                <textarea name="comment" id="Content-comment"
                                          placeholder="Enter content comment" required><%=comment.getContent()%></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn__edit-delete-comment-yes"
                                    style="border: none">Confirm
                            </button>
                            <button type="button"
                                    class="btn-danger btn-danger btn__edit-delete-comment-no"
                                    data-bs-dismiss="modal">No
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--------------------------------------->

        <p class="comment__user-text">
            <%=comment.getContent()%>
        </p>
        <%--            <span class="comment__reply" style="cursor: pointer"><i--%>
        <%--                    class="fa-solid fa-reply fa-rotate-180"></i>Reply</span>--%>
        <%--            <div class="reply-form display-none">--%>
        <%--                <form action="">--%>
        <%--                                            <textarea placeholder="Write reply comment" rows="3"--%>
        <%--                                                      style="margin-top: 20px;"></textarea>--%>
        <%--                    <button type= "submit" class="btn submit-comment__btn">SUBMIT</button>--%>
        <%--                </form>--%>
        <%--            </div>--%>
    </div>
</div>
<%
        }
    }
%>

