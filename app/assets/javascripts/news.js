$(document).ready(function(){
    $(".counter-icon.like").on("click", function(){
        var id = $(this).attr("rel");
        $.ajax({
            url: '/news/' + id + '/like',
            method: 'post',
            success: function(data) {
                $(".counter-label[rel='" + id + "']").text(data);
            }
        });
    });

    $(".counter-icon.comment").on("click", function(){

    });
});
