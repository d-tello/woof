const changeDogPark = () => {
  const viewedParkSelect = document.getElementById("dog_viewed_park_id");
  const parkSelect = document.getElementById("dog_park_ids");

  // This refers to the user show page
  if (parkSelect) {
    parkSelect.addEventListener("change", () => {
    const parkButton = document.getElementById("dog-submit-button");
    parkButton.click();
    })
  }
  // This refers to the homepage
  if (viewedParkSelect) {
    viewedParkSelect.addEventListener("change", () => {
    const viewedParkButton = document.getElementById("dog-submit-button");
    viewedParkButton.click();
    })
  };
};

export {changeDogPark};
