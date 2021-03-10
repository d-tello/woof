const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector("#navbar")
  const header = document.querySelector("#header-home")
  const text = document.querySelector("#navbar > a")

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 40) {
        text.innerText = "Doggies to play"
        header.style.visibility = "hidden";

      } else {
        header.style.visibility = "visible";
        text.innerText = "Woof";
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
