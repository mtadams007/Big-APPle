$( document ).on('turbolinks:load', function() {

    $(".schedule-submit-button").click(function(){
      console.log("i've been clicked")
       $(this).addClass("hideMe");
    });
});
