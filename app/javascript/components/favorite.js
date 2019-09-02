const initFavorite = () => {
  const button_favorite = document.querySelector(".favorite");
  button_favorite.addEventListener("click", (event) => {
    event.preventDefault();
    const hearts_favorite = document.querySelectorAll(".favorite i")
    hearts_favorite.forEach((item) => {
    item.classList.toggle("d-none");
    });
    // if (document.querySelector(".far").style.display == none)
    //   {event_activity.favorite = true}
  });
}

export { initFavorite };
