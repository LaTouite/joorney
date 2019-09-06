const input_photo = document.querySelector('#event_photo');
const photo_uploaded = document.querySelector('#pic-uploaded');

const updatePhoto = (event) => {
  const reader = new FileReader();
  const file_uploaded = event.currentTarget;
  const name_file = file_uploaded.files[0];

  reader.addEventListener("load", () => {
    // photo_uploaded.src = reader.result;
    photo_uploaded.style.backgroundImage = `url(${reader.result})`;
  });

  reader.readAsDataURL(name_file);
}


const initPicturePreview = () => {
  input_photo.addEventListener("input", updatePhoto);
}


export { initPicturePreview }
