const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector("#navbar")
  const header = document.querySelector("#header-home")
  const text = document.querySelector("#navbar > a")

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 40) {
        text.style.transition = "all 2s";
        text.innerText = "Dogs near you"
        header.style.visibility = "hidden";

      } else {
        header.style.visibility = "visible";
        text.style.transition = "all 2s";
        text.innerText = "Woof";
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
