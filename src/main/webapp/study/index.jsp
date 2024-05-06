<%@ page import="javax.swing.*" %>
<%@ page import="model.Course" %>
<%@ page import="model.Chapter" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Lession" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/20/2024
  Time: 7:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--    bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <%--font awesome--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


    <%--  css--%>
    <link rel="stylesheet" href="../assets/css/reset.css">
    <link rel="stylesheet" href="../assets/css/study/study.css">

</head>
<body>
<div class="study">
    <%
        if (request.getAttribute("course") != null) {
            Course c = (Course) request.getAttribute("course");
    %>
    <main>

        <%--            begin head--%>
        <div class="head">
            <div class="head-back"><a href="#"><i class="fa-solid fa-arrow-left"></i></a></div>
            <a href="" class="head-logo"><img src="../img/study/6783729.png" alt=""></a>
            <div class="head-title">HTML CSS for beginners</div>
            <div class="progress-bar">
                <%--            <div class="percent">10%</div>--%>

                <%--            <p class="completed">100 lessions</p>--%>
            </div>
        </div>
        <%--    end head--%>


        <%--  begin video content--%>
        <div class="video-content">
            <div class="main-video">
                <video autoplay controls width="100%" height="auto">
                    <source src="">
                </video>
<%--                <iframe src="" frameborder="0" allowfullscreen></iframe>--%>
            </div>
            <div class="main-video-description">
                <div class="title">
                    <h>First Video</h>
                </div>
                <p class="content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                    Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                    a galley of type and scrambled it to make a type specimen book. It has survived not only five
                    centuries, but also the leap into electroni</p>
            </div>
        </div>
        <%--  end content--%>

        <%-- begin playlist --%>
        <div class="playlist">
            <div class="playlist-contain">
                <div class="head">
                    <h>Course content</h>
                </div>
                <div class="body">

                    <div class="accordion" id="accordionPlaylist-Videos">
                        <%
                            c.getChapters().sort((co1, co2) -> co1.getOrdinal() - co2.getOrdinal());
                            for(Chapter chapter:c.getChapters()) {

                        %>
                        <div class="accordion-item chapter">
                            <h2 class="accordion-header" id="heading<%=chapter.getOrdinal()%>">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapse<%=chapter.getOrdinal()%>" aria-expanded="true"
                                        aria-controls="collapse<%=chapter.getOrdinal()%>">
                                    <p class="id"><%=chapter.getOrdinal()%>.</p>
                                    <%=chapter.getName()%>
                                </button>
                            </h2>
                            <div id="collapse<%=chapter.getOrdinal()%>" class="accordion-collapse collapse"
                                 aria-labelledby="heading<%=chapter.getOrdinal()%>" data-bs-parent="#accordionExample">

                                <div class="accordion-body videos">
                                    <%
                                        for(Lession l: chapter.getLessions()){
                                    %>
                                    <li class="video" id="<%=l.getLink()%>">

                                        <div class="col1">
                                            <h class="title"><p class="id"><%=l.getId()%>.</p><%=l.getName()%></h>
                                            <div class="timeplay">
                                                <img src="../img/study/play.svg" alt="">
                                                <p class="time">${param.time_video}</p>
                                            </div>
                                        </div>
                                        <div class="col2">
                                            <img src="../img/study/icons8-tick.svg" alt="">
                                        </div>

                                        <div class="text">
                                            <%=l.getDescription()%>
                                        </div>
                                    </li>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>


                    </div>

                    <%--          end of playlist videos--%>
                </div>
            </div>
        </div>
        <%--  end playlist--%>

        <%--  begin footer--%>
        <div class="footer">
            <p>Made with love</p>
            <p>Powered by GBN</p>
            <button class="btn-comment">
                <i class="fa-solid fa-cloud"></i>
                Ask&Answer
            </button>
        </div>
        <%--    end footer--%>

    </main>
    <%
        }
    %>
</div>


<div class="modal-comment">
    <div class="modal-container">
        <div class="modal-close btn-commentClose">
            <i class="fa-solid fa-xmark"></i>
        </div>
        <div class="body">
            <div class="row">

                <%
                    int numberOfComments = 8;
                %>

                <div class="comment-head">
                    <h4><%=numberOfComments%> comments</h4>
                    <p>(Don't hesitate to report if you see spam comments)</p>
                </div>
                <div class="comment-box">
                    <div class="avatar">
                        <img src="../img/study/User-Profile-PNG.png" alt="">
                    </div>
                    <div class="comment-box_detail">
                        <%--                            show first-box->display:flex --%>
                        <div class="first-box" style="display: flex">
                            <span>What is your question?</span>
                        </div>
                        <%--                            show second box->display: flex --%>
                        <div class="second-box" style="display: none">
                            <div class="row1">
                                <textarea name="" id="CommentTextArea" cols="30" rows="10"
                                          placeholder="What is your question?"></textarea>
                            </div>
                            <div class="row2">
                                <button class="btn-cancel-comment">Cancel</button>
                                <button class="btn-post-comment">Comment</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="comments">
                    <%for (int i = 1; i < numberOfComments; i++) {%>
                    <jsp:include page="../Component/comment.jsp">
                        <jsp:param name="avatar" value="../img/study/User-Profile-PNG.png"/>
                        <jsp:param name="user_name" value="User's name"/>
                        <jsp:param name="comment_text"
                                   value="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"/>
                        <jsp:param name="comment_time" value="1 month ago"/>
                    </jsp:include>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<script src="../assets/js/study/study.js"></script>--%>
<script>
    // xu li dong/mo chapter va  video
    let videos = document.querySelectorAll('.video');
    let main_video = document.querySelector('.main-video video source')
    let main_video_description_title = document.querySelector('.main-video-description .title h')
    let main_video_description_text = document.querySelector('.main-video-description .content')
    main_video.src = "/images/4d9bc353-f5c6-4f11-abfe-aea1ff5b839a_demo-video.mp4";


    videos.forEach(selected_video => {
        selected_video.onclick = () => {

            for (all_videos of videos) {
                all_videos.classList.remove('active');
                all_videos.querySelector('.video .col1 img').src = "../img/study/play.svg"

            }

            selected_video.classList.add('active');
            selected_video.querySelector('.video .col1 img').src = "../img/study/pause.svg"

            // selected_video.querySelector('img').src = 'images/pause.svg';
            console.log("/images/" + selected_video.getAttribute('id'))
            main_video_description_title.innerHTML = selected_video.querySelector('.video .col1 .title').innerHTML;
            main_video_description_text.innerHTML = selected_video.querySelector('.video .text').innerHTML;
           main_video.src=""
            main_video.src ="/images/" + selected_video.getAttribute('id')

            main_video.parentElement.load();

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



</script>


</body>
</html>
