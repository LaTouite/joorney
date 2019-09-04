import Chart from "chart.js"


const chartDo = () => {
  const budget_tot = document.querySelector('#budget-tot').dataset.budgetTotal
  const budget_act = document.querySelector('#budget-activities').dataset.budgetActivities
  const budget_rem = document.querySelector('#budget-remaining').dataset.budgetRemaining


  var CHART = document.getElementById("doughnut-chart");

  let myChart = new Chart(CHART, {
      type: 'doughnut',
      data: {
        // labels: ["Budget restant", "Logement", "Transport", "Activités"],
        datasets: [
          {
            label: "Population (millions)",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f", "#E59B43"],
            data: [budget_rem,budget_act,0,0]
          },
          //           {
          //   label: "blaba (millions)",
          //   backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
          //   data: [2478,5267,30]
          // }
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
