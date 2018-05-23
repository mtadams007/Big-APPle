let max = 4
let counter = 0;
$( document ).on('turbolinks:load', function() {

    $(".schedule-submit-button").click(function(){
       $(this).addClass("hideMe");
       counter++;
       if (counter === max){
         counter = 0;
       $("#profileLink").removeClass("hideMe");
     }
    });
});
