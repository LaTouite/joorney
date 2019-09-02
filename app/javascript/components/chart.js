import Chart from "chart.js"


const chartDo = () => {

  var CHART = document.getElementById("doughnut-chart");

  let myChart = new Chart(CHART, {
      type: 'doughnut',
      data: {
        labels: ["Logement", "Activités", "Transport"],
        datasets: [
          {
            label: "Population (millions)",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
            data: [2478,5267,734]
          },
                    {
            label: "blaba (millions)",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
            data: [2478,5267,734]
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

}

export { chartDo };
