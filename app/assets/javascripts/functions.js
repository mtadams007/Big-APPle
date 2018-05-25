let max = 4
let counter = 0;
$( document ).on('turbolinks:load', function() {

num_of_caro = 5
num_of_business = 4

for(let  k=1; k<=num_of_business;k++){
  for(let i=1;i<=num_of_caro;i++){
      $(`.schedule-submit-button.business${k}_carousel${i}`).click(function(){
        $(`.business${k}_carousel${i}`).addClass("hideMe");
        counter++;
        if (counter === max){
          counter = 0;
          let new_url = window.location.origin;
          new_url += "/schedules/latest"
          window.location = new_url
        }
     });
  }
}

});
