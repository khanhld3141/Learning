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