window.addEventListener("turbolinks:load", () =>{
  const $shooting_date = $("#shooting_date");

  $shooting_date.on("change",function() {
    const $post_images = $(".post-images")
    $post_images.hide();
    $(`.${$shooting_date.val()}`).show();
  });
});
