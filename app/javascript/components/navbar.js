const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector("#navbar")
  const header = document.querySelector("#header-home")
  const logoBefore = document.querySelector("#logo-before")
  const logoAfter = document.querySelector("#logo-after")

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 35) {
        header.classList.remove('toggle-opacity-in');
        header.classList.add('toggle-opacity-out');
        logoBefore.classList.add('toggle-opacity-out');
        logoBefore.classList.remove('toggle-opacity-in');
        logoAfter.classList.remove('toggle-opacity-out');
        logoAfter.classList.add('toggle-opacity-in');
        logoAfter.style.display = "block"
      } else {
        header.classList.add('toggle-opacity-in');
        header.classList.remove('toggle-opacity-out');
        logoBefore.classList.add('toggle-opacity-in');
        logoBefore.classList.remove('toggle-opacity-out');
        logoAfter.classList.add('toggle-opacity-out');
        logoAfter.classList.remove('toggle-opacity-in');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
