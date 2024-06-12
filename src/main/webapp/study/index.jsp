<%@ page import="javax.swing.*" %>
<%@ page import="model.Course" %>
<%@ page import="model.Chapter" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Lession" %>
<%@ page import="model.LessionComment" %><%--
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

    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <%--  css--%>
    <link rel="stylesheet" href="../assets/css/reset.css">
    <link rel="stylesheet" href="../assets/css/study/study.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/manage-chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/update-user.css">
</head>
<body>
<!-- MODAL DELETE COMMENT -->
<div class="modal fade modal__delete" id="modal__delete_1">
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
                <a href=""
                   class="btn-primary btn__edit-delete-comment-yes btnDeleteComment">Yes</a>
                <button type="button" class="btn-danger btn__edit-delete-comment-no btnCancelDelete"
                        data-bs-dismiss="modal">No
                </button>
            </div>
        </div>
    </div>
</div>
<!--------------------------------------->

<!-- MODAL UPDATE COMMENT -->
<div class="modal fade modal__update" id="modal__update-commment_1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal"></button>
            </div>
            <form action="/update-comment-of-course" method="post">
                <input name="courseid" value="" hidden="hidden">
                <input name="id" value="" hidden="hidden"   >
                <div class="modal-body">
                    <div class="Content-comment">
                        <label for="Content-comment">Content comment</label>
                        <textarea name="comment" id="Content-comment"
                                  placeholder="Enter content comment" required style="background-color: #f6f6f6; border: 1px solid #dadada;border-radius: 5px;margin-bottom: 25px;padding: 20px;width: 100%;min-height: 130px;">comment content</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn__edit-delete-comment-yes btnConfirm"
                            style="border: none">Confirm
                    </button>
                    <button type="button"
                            class="btn-danger btn-danger btn__edit-delete-comment-no btnNo"
                            data-bs-dismiss="modal">No
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--------------------------------------->

<div class="study">
    <%
        if (request.getAttribute("course") != null) {
            Course c = (Course) request.getAttribute("course");
    %>
    <main data-course="<%=c.getId()%>" id="main">

        <%--            begin head--%>
        <div class="head">
            <div class="head-back"><a href="/home"><i class="fa-solid fa-arrow-left"></i></a></div>
            <a href="" class="head-logo"><img src="../img/study/6783729.png" alt=""></a>
            <div class="head-title"><%=c.getName()%></div>
            <div class="progress-bar">
                <%--            <div class="percent">10%</div>--%>

                <%--            <p class="completed">100 lessions</p>--%>
            </div>
        </div>
        <%--    end head--%>


        <%--  begin video content--%>
        <div class="video-content">
            <div class="main-video">
                <video controlslist="nodownload" autoplay controls width="100%" height="auto">
                    <source src="/video?id=11&courseid=1" type="video/mp4">
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
                <button id="btnComment" class="btn-comment">
                    <i class="fa-solid fa-cloud"></i>
                    Ask&Answer
                </button>
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
                            c.getChapters().sort((co1, co2) -> co1.getId() - co2.getId());
                            for (int  j=0;j<c.getChapters().size();j++) {
                                Chapter chapter=c.getChapters().get(j);
                        %>
                        <div class="accordion-item chapter">
                            <h2 class="accordion-header" id="heading<%=chapter.getId()%>">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapse<%=chapter.getId()%>" aria-expanded="true"
                                        aria-controls="collapse<%=chapter.getId()%>">
                                    <p class="id"><%=j%>.</p>
                                    <%=chapter.getName()%>
                                </button>
                            </h2>
                            <div id="collapse<%=chapter.getId()%>" class="accordion-collapse collapse"
                                 aria-labelledby="heading<%=chapter.getId()%>" data-bs-parent="#accordionExample">

                                <div class="accordion-body videos">
                                    <%
                                       for(int i=0;i<chapter.getLessions().size();i++){
                                    %>
                                    <li class="video" id="<%=chapter.getLessions().get(i).getLink()%>"
                                        data-lesson="<%=chapter.getLessions().get(i).getId()%>" data-name="<%=chapter.getLessions().get(i).getName()%>" data-description="<%=chapter.getLessions().get(i).getDescription()%>"
                                        data-origin="<%=i+1%>">

                                        <div data-lesson="<%=chapter.getLessions().get(i).getId()%>" class="col1">
                                            <h class="title"><p class="id"><%=i+1%>.</p><%=chapter.getLessions().get(i).getName()%>
                                            </h>
                                            <div class="timeplay">
                                                <img src="../img/study/play.svg" alt="">
                                                <p class="time">${param.time_video}</p>
                                            </div>
                                        </div>
                                        <div class="col2">
                                            <img src="../img/study/icons8-tick.svg" alt="">
                                        </div>

                                        <div class="text">
                                            <%=chapter.getLessions().get(i).getDescription()%>
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

        </div>
        <%--    end footer--%>

    </main>
    <%
        }
    %>
</div>

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

<div class="modal-comment">
    <div class="modal-container">
        <div class="modal-close btn-commentClose">
            <i class="fa-solid fa-xmark"></i>
        </div>
        <div class="body">
            <div class="row">

                <div class="comment-head">
                    <h4 id="numberComment"></h4>
                    <p>(Don't hesitate to report if you see spam comments)</p>
                </div>
                <div class="comment-box">
                    <div id="avatar" class="avatar">
                        <img src="images/${sessionScope.user.avatar}" alt="">
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
                                <button id="btnSubmitComment" class="btn-post-comment">Comment</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="comments" class="comments">

                </div>


            </div>
        </div>
    </div>
</div>

<%--<script src="../assets/js/study/study.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    // xu li dong/mo chapter va  video
    let videos = document.querySelectorAll('.video');
    let main_video = document.querySelector('.main-video video source')
    let main_video_Video=document.querySelector(".main-video video")
    let main_video_description_title = document.querySelector('.main-video-description .title h')
    let main_video_description_text = document.querySelector('.main-video-description .content')
    main_video.src = "";
    let btnCommentModal = document.querySelector('#btnComment');
    let main = document.querySelector('#main')
    let col = document.querySelector('.col1')
    videos.forEach(selected_video => {
        selected_video.onclick = () => {
            console.log(selected_video.dataset.origin)
            for (all_videos of videos) {
                all_videos.classList.remove('active');
                all_videos.querySelector('.video .col1 img').src = "../img/study/play.svg"

            }
            main_video_description_title.innerHTML = selected_video.dataset.origin+". "+selected_video.dataset.name;
            main_video_description_text.innerHTML =selected_video.dataset.description;
            main_video.src="/video?courseid="+main.dataset.course+"&id="+selected_video.dataset.lesson;
            main_video_Video.load();
            main_video_Video.play()


            selected_video.classList.add('active');
            selected_video.querySelector('.video .col1 img').src = "../img/study/pause.svg"
            // let formData = new FormData();
            // formData.append('courseid', main.dataset.course);
            // formData.append('id', selected_video.dataset.lesson)
            // $.ajax({
            //     url: '/get-lesson',
            //     type: 'POST',
            //     data: formData,
            //     processData: false,
            //     contentType: false,
            //     success: (data) => {
            //         main_video.src = ""
            //         main_video.src = "/images/" + data.Link;
            //         main_video_description_title.innerHTML = selected_video.dataset.origin+". "+ data.Name;
            //         main_video_description_text.innerHTML = data.Description;
            //         col.dataset.lesson = selected_video.dataset.lesson;
            //         main_video.parentElement.load();
            //     }
            // })
             selected_video.querySelector('img').src = 'images/pause.svg';




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
    let contentModal = document.querySelector('#comments')
    let btnSubmitComment = document.querySelector('#btnSubmitComment')
    let commentText = document.querySelector('#CommentTextArea')
    btnSubmitComment.addEventListener('click', () => {
        let formData = new FormData();
        formData.append('lessonid', col.dataset.lesson);
        formData.append('content', commentText.value)
        $.ajax({
            url: '/post-comment',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: () => {
                contentModal.innerHTML = ''
                showComment();
            }
        })

    })

    function showComment() {
        let formData = new FormData();
        formData.append('id', col.dataset.lesson);
        $.ajax({
            url: '/get-comment',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: (data) => {
                let numberofComments = document.querySelector('#numberComment')
                numberofComments.innerHTML = '<h4>' + data.length + ' comments </h4>';
                let html = '';
                data.map(item => {
                    html += `
                        <div class="comment">
                            <div class="avatar">
                                <img src="/images/` + item.author.Avatar + `" alt="">
                            </div>
                            <div class="comment-body">
                                <div class="comment-wrapper">
                                    <div class="comment-content">
                                        <div class="comment-content__head">
                                            <a href="">` + item.author.Name + `</a>
                                        </div>
                                        <div class="comment-content__body">
                                           ` + item.Content + `
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-modify">
                                        <div class="edit-delete-comment-block display-none">
                                            <button type="button" data-bs-toggle="modal"
                                                    class="button-edit-delete-comment"
                                                    data-bs-target="#modal__update-commment_1" title="Delete comment">
                                                Edit
                                            </button>
                                            <button type="button" data-bs-toggle="modal"
                                                    class="button-edit-delete-comment" data-bs-target="#modal__delete_1"
                                                    title="Delete comment">
                                                Delete
                                            </button>
                                        </div>
                                </div>
                            </div>
                        </div>
            `;

                })
                contentModal.innerHTML = html;
            }
        });
        modalComment.classList.add('open')
    }

    function closeComment() {
        modalComment.classList.remove('open')
    }

    btnComment.addEventListener('click', showComment);
    btnClose.addEventListener('click', closeComment);

    modalComment.addEventListener('click', closeComment)

    modalCommentContainer.addEventListener('click', function (event) {
        event.stopPropagation();
    })


    // xu li su kien dong mo text area comment
    let firstBoxComment = document.querySelector('.first-box');
    let secondBoxComment = document.querySelector('.second-box');
    let btnCancelComment = document.querySelector('.btn-cancel-comment');
    let btnPostComment = document.querySelector('.btn-post-comment');


    function showSecondBoxComment() {
        firstBoxComment.style.display = 'none';
        secondBoxComment.style.display = 'flex';
    }

    function closeSecondBoxComment() {
        document.getElementById('CommentTextArea').value = '';
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
            if (!moreVisible) {
                selected_btn.querySelector('.more').style.display = 'block';
                moreVisible = true;
            } else {
                selected_btn.querySelector('.more').style.display = 'none';
                moreVisible = false;
            }
        }
    });

    modalCommentContainer.addEventListener('click', function () {
        for (btnMore of btnMores) {
            btnMore.querySelector('.more').style.display = 'none';

        }
    })

    for (btnMore of btnMores) {
        btnMore.addEventListener('click', function (event) {
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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script type="text/javascript">
    function showToast(message, type) {
        let backgroundColor, className;
        if (type === "1") {
            backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
            className = "success"
        } else if (type === "0") {
            backgroundColor = "linear-gradient(to right, #ff5f6d, #ffc371)";
            className = "error"
        }

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "bottom",
            position: "right",
            backgroundColor: backgroundColor,
            stopOnFocus: true,
            className: className,

        }).showToast();
    }
    window.addEventListener('pageshow', function(event) {
        if (event.persisted) {
            window.location.reload();
        }
    });
    <%
        if (session.getAttribute("success")!=null) {
    %>
    showToast("<%= session.getAttribute("success") %>", "1");
    <%
    session.setAttribute("success",null);
      }
    %>

    <%

      if (session.getAttribute("error")!=null) {
  %>
    showToast("<%= session.getAttribute("error") %>", "0");
    <%
    session.setAttribute("error",null);
      }
    %>
</script>

</body>
</html>
