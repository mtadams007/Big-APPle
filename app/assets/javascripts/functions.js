
$( document ).on('turbolinks:load', function() {
  maxActivities = 4
  counter = 0;
num_of_caro = 5
num_of_business = 4

for(let  k=1; k<=num_of_business;k++){
  for(let i=1;i<=num_of_caro;i++){
      $(`.schedule-submit-button.business${k}_carousel${i}`).click(function(){
        $(`.business${k}_carousel${i}`).addClass("hideMe");
        counter++;
        if (counter === maxActivities){
          counter = 0;
          let new_url = window.location.origin;
          new_url += "/schedules/latest"
          window.location = new_url
        }
     });
  }
}

});
