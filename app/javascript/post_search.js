window.addEventListener("turbolinks:load", () =>{
  const $shooting_date = $("#shooting_date");
  const $event = $("#event_id");
  const $all_show_btn = $("#all_show_btn");

  let btn_display = false;
  show_change()

  // 日付で検索---------------------------
  $shooting_date.on("change",function() {
    const $post_images = $(".post-images");
    $event.val(1);
    $post_images.hide();
    $(`.${$shooting_date.val()}`).show();
    btn_display = true;
    show_change()
  });
  // --------------------------------------
  // イベントで検索----------------------
  $event.on("change",function(){
    const $post_images = $(".post-images");
    $shooting_date.val("");
    $post_images.hide();
    $(`.${$event.val()}`).show();
    btn_display = true;
    show_change()
  });
  // -------------------------------------

  $all_show_btn.on("click", function(){
    $all_show_btn.hide();
    $(".post-images").show();
  });

  function show_change(){
    if(btn_display == true){
      console.log(btn_display);
      $all_show_btn.show();
    } else {
      console.log(btn_display);
      $all_show_btn.hide();
    }
  }
  
});
