<div class="comment">
    <div class="avatar">
        <img src="${param.avatar}" alt="">
    </div>
    <div class="comment-body">
        <div class="comment-wrapper">
            <div class="comment-content">
                <div class="comment-content__head">
                    <a href="">${param.user_name}</a>
                </div>
                <div class="comment-content__body">
                    ${param.comment_text}
                </div>
            </div>
            <div class="comment-time">
                <div class="comment-createdAt">
                    <div class="comment-createdAtLeft">
<%--                        <button class="btn-like">Like</button>--%>
                        <span class="btn-reply">Reply</span>
                    </div>
                    <div class="comment-createdAtRight">
                        <span class="time">${param.comment_time}</span>
                        <div class="btn-more">
                            <i class="fa-solid fa-ellipsis">
                                <%--                       de show ra thi display : block--%>
                                <div class="more" style="display: none">
                                    <ul class="list-option-more">
                                        <li><h1>Edit</h1></li>
                                        <li><h1>Delete</h1></li>
                                    </ul>
                                </div>
                            </i>
                        </div>
                    </div>
                </div>
                <div class="comment-box comment-box-reply" style="display: none">
                    <div class="avatar">
                        <img src="../img/study/User-Profile-PNG.png" alt="">
                    </div>
                    <div class="comment-box_detail">
                        <%--                            show second box->display: flex --%>
                        <div class="second-box">
                            <div class="row1">
                                <textarea name="" id="ReplyTextArea" cols="30" rows="10" placeholder="Reply"></textarea>
                            </div>
                            <div class="row2">
                                <button class="btn-cancel-comment">Cancel</button>
                                <button class="btn-post-comment">Reply</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>