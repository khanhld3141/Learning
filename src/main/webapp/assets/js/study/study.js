// xu li dong/mo chapter va  video
let videos = document.querySelectorAll('.video');
let main_video = document.querySelector('.main-video iframe')
let main_video_description_title = document.querySelector('.main-video-description .title h')
let main_video_description_text = document.querySelector('.main-video-description .content')
main_video.src = "https://www.youtube.com/embed/R6plN3FvzFY";


videos.forEach(selected_video => {
    selected_video.onclick = () => {

        for (all_videos of videos) {
            all_videos.classList.remove('active');
            all_videos.querySelector('.video .col1 img').src = "../img/study/play.svg"

        }

        selected_video.classList.add('active');
        selected_video.querySelector('.video .col1 img').src = "../img/study/pause.svg"

        // selected_video.querySelector('img').src = 'images/pause.svg';

        main_video_description_title.innerHTML = selected_video.querySelector('.video .col1 .title').innerHTML;
        main_video_description_text.innerHTML = selected_video.querySelector('.video .text').innerHTML;
        main_video.src ="https://www.youtube.com/embed/" + selected_video.getAttribute('id')
    }
});

// Xu li modal comment

main_video_description_text.innerHTML = videos[0].querySelector('.text').innerHTML;
main_video_description_title.innerHTML = videos[0].querySelector('.col1 .title').innerHTML;

// xu li su kien dong/mo modal
let btnComment = document.querySelector('.btn-comment');
let modalComment = document.querySelector('.modal-comment');
let btnClose = document.querySelector('.btn-commentClose');
let modalCommentContainer = document.querySelector('.modal-container')

function showComment()
{
    modalComment.classList.add('open')
}

function closeComment()
{
    modalComment.classList.remove('open')
}

btnComment.addEventListener('click', showComment);
btnClose.addEventListener('click', closeComment);

modalComment.addEventListener('click', closeComment)

modalCommentContainer.addEventListener('click', function(event)
{
    event.stopPropagation();
})


// xu li su kien dong mo text area comment
let firstBoxComment = document.querySelector('.first-box');
let secondBoxComment = document.querySelector('.second-box');
let btnCancelComment = document.querySelector('.btn-cancel-comment');
let btnPostComment = document.querySelector('.btn-post-comment');



function showSecondBoxComment()
{
    firstBoxComment.style.display = 'none';
    secondBoxComment.style.display = 'flex';
}

function closeSecondBoxComment()
{
    document.getElementById('CommentTextArea').value='';
    firstBoxComment.style.display = 'flex';
    secondBoxComment.style.display = 'none';
}

firstBoxComment.addEventListener('click', showSecondBoxComment);
btnCancelComment.addEventListener('click', closeSecondBoxComment);
btnPostComment.addEventListener('click', closeSecondBoxComment);


// Xu li su ki dong/mo edit/delete comment tai dau 3 cham
let btnMores = document.querySelectorAll('.btn-more');
let moreVisible = false;

btnMores.forEach(selected_btn => {
    selected_btn.onclick = () => {

        for (btnMore of btnMores) {
            btnMore.querySelector('.more').style.display = 'none';
        }
        if(!moreVisible)
        {
            selected_btn.querySelector('.more').style.display = 'block';
            moreVisible = true;
        }
        else{
            selected_btn.querySelector('.more').style.display = 'none';
            moreVisible = false;
        }
    }
});

modalCommentContainer.addEventListener('click', function ()
{
    for(btnMore of btnMores)
    {
        btnMore.querySelector('.more').style.display = 'none';

    }
})

for(btnMore of btnMores)
{
    btnMore.addEventListener('click', function (event)
    {
        event.stopPropagation();
    })
}

// ... (phần code trước đó)

// Xu li button reply
function closeReply(event) {
    const commentBoxReply = event.target.closest('.comment-box-reply');
    commentBoxReply.style.display = 'none';
    commentBoxReply.querySelector('#ReplyTextArea').value = '';
}

let btnReplys = document.querySelectorAll('.btn-reply');

btnReplys.forEach(selected_btn => {
    selected_btn.addEventListener('click', (event) => {
        const commentBoxReply = event.target.closest('.comment-time').querySelector('.comment-box-reply');
        commentBoxReply.style.display = 'flex';

        const btnCancelReply = commentBoxReply.querySelector('.btn-cancel-comment');
        const btnPostReply = commentBoxReply.querySelector('.btn-post-comment');

        btnCancelReply.addEventListener('click', closeReply);
        btnPostReply.addEventListener('click', closeReply);
    });
});

// ... (phần code tiếp theo)


