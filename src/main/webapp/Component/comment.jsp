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
                        <button class="btn-like">Like</button>
                        <span class="btn-reply">Reply</span>
                    </div>
                    <div class="comment-createdAtRight">
                        <span class="time">${param.comment_time}</span>
                        <i class="fa-solid fa-ellipsis btn-report"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>