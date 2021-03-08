const toggleActivatesHiddenButton = () => {
  const toggles = document.querySelectorAll('.toggle');
  toggles.forEach((toggle) => {
    toggle.addEventListener( 'change', () => {
      const button = toggle.closest('li').querySelector('.btn');
      button.click()
    })
  });
}

export { toggleActivatesHiddenButton }
