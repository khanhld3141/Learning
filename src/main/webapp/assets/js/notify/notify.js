$(document).ready(function () {
    var toastQueue = [];

    function showNextToast() {
        if (toastQueue.length > 0) {
            var nextToast = toastQueue.shift();
            $(nextToast).toast('show');
        }
    }

    $('.toast').on('hidden.bs.toast', function () {
        $(this).remove();
        showNextToast();
    });

    //var message = '<%= request.getAttribute("message") %>';
    //var type = '<%= request.getAttribute("type") %>';
     var message = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto, nobis?";
     var type = "success";


    if (message && type) {
        var newToast = $('#myToast').clone().attr('id', '').appendTo('.toast-container');
        newToast.find('.toast-body').html('<p class="toast-content">' + message + '</p>');

        if (type === 'success') {
            newToast.find('.toast-header strong').html('<i class="fa-solid fa-circle-check" style="margin-right: 10px;"></i>Success');
            newToast.find('.toast-header').css({
                'color': 'green',
                'font-size': '14px'
            });
            newToast.find('.toast-header strong').css({
                'font-weight' : '600'
            });
            newToast.find('.toast-content').css({
                'font-weight' : '500',
                'font-size' : '14px',
                'padding': '5px 0 10px 0',
                'line-height': '17px'
            });
            newToast.find('.toast-body').css('background', '#53aa27');
        } else if (type === 'error') {
            newToast.find('.toast-header strong').html('<i class="fa-solid fa-circle-xmark" style="margin-right: 10px;"></i>Error');
            newToast.find('.toast-header').css({
                'color': 'red',
                'font-size': '14px'
            });
            newToast.find('.toast-header strong').css({
                'font-weight' : 600
            });
            newToast.find('.toast-content').css({
                'font-weight' : '500',
                'font-size' : '14px',
                'padding': '5px 0 10px 0',
                'line-height': '17px'
            });
            newToast.find('.toast-body').css('background', '#d9534f');
        }

        toastQueue.push(newToast);
        if (toastQueue.length === 1) {
            showNextToast();
        }
    } else {
        $('.toast-container').hide();
    }
});