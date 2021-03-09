const changeDogPark = () => {
  const select = document.getElementById("dog_viewed_park_id");
  if (select) {
    select.addEventListener("change", () => {
      const button = document.getElementById("dog-submit-button");
      button.click();
    });
  }
};

export {changeDogPark};