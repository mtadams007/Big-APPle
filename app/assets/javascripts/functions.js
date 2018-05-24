let max = 4
let counter = 0;
$( document ).on('turbolinks:load', function() {

    $(".schedule-submit-button.museum1_carousel1").click(function(){
       $(".museum1_carousel1").addClass("hideMe");
       counter++;
       if (counter === max){
         counter = 0;
       $("#profileLink").removeClass("hideMe");
     }
    });
    $(".schedule-submit-button.museum2_carousel1").click(function(){
       $(".museum2_carousel1").addClass("hideMe");
       counter++;
       if (counter === max){
         counter = 0;
       $("#profileLink").removeClass("hideMe");
     }
    });
    $(".schedule-submit-button.restaurant1_carousel1").click(function(){
       $(".restaurant1_carousel1").addClass("hideMe");
       counter++;
       if (counter === max){
         counter = 0;
       $("#profileLink").removeClass("hideMe");
     }
    });
    $(".schedule-submit-button.restaurant2_carousel1").click(function(){
       $(".restaurant2_carousel1").addClass("hideMe");
       counter++;
       if (counter === max){
         counter = 0;
       $("#profileLink").removeClass("hideMe");
     }
    });
});
