// calcul du prix en fonction du nb de participants
const initPrice = () => {
  const participantsNb = document.querySelector("#event_activity_nb_of_participants");
  const calcul = document.querySelector(".calcul");
  const price = document.querySelector(".price").innerText;
  const priceWoCurrency = parseFloat(price.slice(0, -1));

  participantsNb.addEventListener("change", (event) => {
    const part = participantsNb.value;
    calcul.innerHTML = part * priceWoCurrency;
  });
}

export { initPrice };
