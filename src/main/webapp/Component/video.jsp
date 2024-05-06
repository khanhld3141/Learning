<%--thay id = ten cua video--%>
<%--
vi du :https://www.youtube.com/watch?v=R6plN3FvzFY
ten video la R6plN3FvzFY
--%>
<li class="video" id=${param.name_video}>
    <div class="col1">
        <h class="title"><p class="id">${param.number_video}.</p>${param.title_video}</h>
        <div class="timeplay">
            <img src="../img/study/play.svg" alt="">
            <p class="time">${param.time_video}</p>
        </div>
    </div>
    <div class="col2">
        <img src="../img/study/icons8-tick.svg" alt="">
    </div>

    <div class="text">
        ${param.text_video}
    </div>
</li>