const sendMessageWithEnter = () => {
  const chat = document.querySelector('#message_content');

  if (chat) {
    chat.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') {
        document.querySelector("#new_message > input").click();
      }
    })
  }
}

export { sendMessageWithEnter }
