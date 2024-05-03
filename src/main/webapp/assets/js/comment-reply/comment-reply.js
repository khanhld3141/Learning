document.addEventListener("DOMContentLoaded", function () {
    const replyButtons = document.querySelectorAll('.comment__reply');
    replyButtons.forEach(button => {
        button.addEventListener('click', function () {
            const replyForm = this.nextElementSibling;
            replyForm.classList.toggle('display-none');
        });
    });
});


document.addEventListener("DOMContentLoaded", function () {
    const replyButtons = document.querySelectorAll('.fa-ellipsis');
    replyButtons.forEach(button => {
        button.addEventListener('click', function () {
            const replyForm = this.nextElementSibling;
            replyForm.classList.toggle('display-none');
        });
    });
});