const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector("#navbar")
  const header = document.querySelector("#header-home")
  const logo = document.querySelector("#logo")

  if (typeof(header) != 'undefined' && header != null) {
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 50) {
        logo.innerText = "Dogs near you"
        header.style.visibility = "hidden"
      } else {
        logo.innerText = "Woof"
        header.style.visibility = "visible"
      }
    });
  };
  }
}

export { initUpdateNavbarOnScroll };
