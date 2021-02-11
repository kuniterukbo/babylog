function post() {
  const submit = document.getElementById("submit");
  const search_shooting_date = document.getElementById("shooting_date");

  search_shooting_date.addEventListener("change", () => {
    console.log(search_shooting_date.value);
   const post_image = document.querySelectorAll(".post-image")
   console.log(post_image)
    // image.classList.add('none');
    // const post_shooting_date = document.getElementsByClassName(search_shooting_date.value);
    // console.log(post_shooting_date);
    // post_shooting_date.classList.add('none');
    // const oya = post_shooting_date.parentNode.parentNode;
    // oya.style.display = 'none';
  });
}
window.addEventListener("DOMContentLoaded", post)
