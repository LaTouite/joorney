const CHART = document.getElementById("doughnut-chart");

let chartDo = new Chart(CHART, {
    type: 'doughnut',
    data: {
      labels: ["Logement", "Activités", "Transport", "Autres"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
          data: [2478,5267,734,784]
        }
      ]
    },
    options: {
      name: {
        display: true,
        // text: 'Predicted world population (millions) in 2050'
      },
      // animation:{
      //   // animateRotate: true,
      //   animateScale: true,
      //   // animateRotate: true,
      // },
    }
});

export { chartDo };
