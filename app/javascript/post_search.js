function post() {
  const submit = document.getElementById("submit");
  const search_shooting_date = document.getElementById("shooting_date");

  shooting_date.addEventListener("change", () => {
    console.log(search_shooting_date.value)

    const post_shooting_date = document.getElementsByClassName(search_shooting_date.value)
    console.log(post_shooting_date)
  });
}
window.addEventListener("load", post)