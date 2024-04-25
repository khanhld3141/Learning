<%@ page import="javax.swing.*" %><%--
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <%--font awesome--%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<%--  css--%>
  <link rel="stylesheet" href="../assets/css/reset.css">
  <link rel="stylesheet" href="../assets/css/study/study.css">

</head>
<body>
    <div class="study">
      <main>

    <%--    begin head--%>
        <div class="head">
          <div class="head-back"><a href="#"><i class="fa-solid fa-arrow-left"></i></a></div>
          <a href="" class="head-logo"><img src="../img/study/6783729.png" alt=""></a>
          <div class="head-title">HTML CSS for beginners</div>
          <div class="progress-bar">
<%--            <div class="percent">10%</div>--%>
              <%
                int numberOfChapters = 7;
              %>

<%--            <p class="completed">100 lessions</p>--%>
          </div>
        </div>
    <%--    end head--%>


    <%--  begin video content--%>
        <div class="video-content">
          <div class="main-video">
            <iframe src="" frameborder="0" allowfullscreen></iframe>
          </div>
          <div class="main-video-description">
            <div class="title">
                <h>First Video</h>
            </div>
            <p class="content">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electroni</p>
          </div>
        </div>
    <%--  end content--%>

    <%-- begin playlist --%>
        <div class="playlist">
          <div class="playlist-contain">
            <div class="head"><h>Course content</h></div>
            <div class="body">
    <%--        begin  playlist video--%>
              <div class="accordion" id="accordionPlaylist-Videos">
                  <%for(int i = 1; i <= numberOfChapters; i++){%>
                  <jsp:include page="../Component/chapter.jsp">
                      <jsp:param name="number_chapter" value="<%=i%>" />
                      <jsp:param name="title_chapter" value="Chapter's Name" />
                  </jsp:include>
                  <%}%>
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
                                    <textarea name="" id="CommentTextArea" cols="30" rows="10" placeholder="What is your question?"></textarea>
                                </div>
                                <div class="row2">
                                    <button class="btn-cancel-comment">Cancel</button>
                                    <button class="btn-post-comment">Comment</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comments">
                        <%for(int i = 1; i < numberOfComments; i++){%>
                        <jsp:include page="../Component/comment.jsp">
                            <jsp:param name="avatar" value="../img/study/User-Profile-PNG.png"/>
                            <jsp:param name="user_name" value="User's name" />
                            <jsp:param name="comment_text" value="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled" />
                            <jsp:param name="comment_time" value="1 month ago"/>
                        </jsp:include>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../assets/js/study/study.js"></script>

</body>
</html>
