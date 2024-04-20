<%--
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
            <div class="percent">10%</div>
            <p class="completed">10/100 lessions</p>
          </div>
        </div>
    <%--    end head--%>

    <%--  begin video content--%>
        <div class="video-content">
          <div class="main-video">
            <iframe src="https://www.youtube.com/embed/R6plN3FvzFY" frameborder="0" allowfullscreen></iframe>
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
              <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Chapter 1
                        <img src="../img/study/reshot-icon-down-arrow-triangle-8EV2HR4UBG-faa80.svg" alt="">
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <li class="video">
                            <h class="title">Lession 1</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                        <li class="video">
                            <h class="title">Lession 2</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                        <li class="video">
                            <h class="title">Lession 3</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      Chapter 2
                        <img src="../img/study/reshot-icon-down-arrow-triangle-8EV2HR4UBG-faa80.svg" alt="">
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <li class="video">
                            <h class="title">Lession 3</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                        <li class="video">
                            <h class="title">Lession 4</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                        <li class="video">
                            <h class="title">Lession 5</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      Chapter 3
                        <img src="../img/study/reshot-icon-down-arrow-triangle-8EV2HR4UBG-faa80.svg" alt="">
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <li class="video">
                            <h class="title">Lession 6</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                        <li class="video">
                            <h class="title">Lession 7</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                        <li class="video">
                            <h class="title">Lession 8</h>
                            <img src="../img/study/pause.svg" alt="">
                            <p class="time">1:00</p>
                        </li>
                    </div>
                  </div>
                </div>
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

</body>
</html>
