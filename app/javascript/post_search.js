window.addEventListener("turbolinks:load", () =>{
  const $shooting_date = $("#shooting_date");
  const $event = $("#event_id");
  const $all_show_btn = $("#all_show_btn");
  const $post_images = $(".post-images");

  let btn_display = false;
  show_change()

  // 日付で検索---------------------------
  $shooting_date.on("change",function() {
    $event.val(1);
    $post_images.hide();
    $(`.${$shooting_date.val()}`).show();
    btn_display = true;
    show_change()
  });
  // --------------------------------------
  // イベントで検索----------------------
  $event.on("change",function(){
    $shooting_date.val("");
    $post_images.hide();
    $(`.${$event.val()}`).show();
    btn_display = true;
    show_change();
  });
  // -------------------------------------

  //全て画像を表示-----------------------
  $all_show_btn.on("click", function(){
    $all_show_btn.hide();
    $post_images.show();
    $shooting_date.val("");
    $event.val(1);
  });
//  -------------------------------------


  function show_change(){
    if(btn_display == true){
      $all_show_btn.show();
    } else {
      $all_show_btn.hide();
    }
  }
  
});
