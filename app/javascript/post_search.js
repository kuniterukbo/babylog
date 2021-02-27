function post() {
  const $shooting_date = $("shooting_date")
  const $test = $("#test");
  console.log($test.value);
  $test.text("bbb");
}

window.addEventListener("DOMContentLoaded", post);
