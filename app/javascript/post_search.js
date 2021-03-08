window.addEventListener("turbolinks:load", () =>{
  const $shooting_date = $("#shooting_date");
  const $event = $("#event_id");

  // 日付で検索---------------------------
  $shooting_date.on("change",function() {
    const $post_images = $(".post-images")
    $post_images.hide();
    $(`.${$shooting_date.val()}`).show();
  });
  // --------------------------------------
  // イベントで検索----------------------
  $event.on("change",function(){
    const $post_images = $(".post-images")
    $post_images.hide();
    $(`.${$event.val()}`).show();
  });
  // -------------------------------------
  
});
