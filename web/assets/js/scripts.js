$( document ).ready(function() {
    $('.showMore').click(function() {
        var step = $(this);
        if ($(this).next().is(':hidden')) {
            step.find('i').removeClass('fa-caret-right').addClass('fa-caret-down');
            step.html(step.html().replace("more", "less"));
            step.next().slideDown('fast');
        }
        else {
            step.find('i').removeClass('fa-caret-down').addClass('fa-caret-right');
            step.html(step.html().replace("less", "more"));
            step.next().slideUp('fast');
        }
    });
});