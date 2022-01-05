
$(document).on('turbolinks:load', function() {

  var ctx = document.getElementById('myChart').getContext('2d');
  console.log('ctx.canvas.dataset.data', ctx.canvas.dataset.data);
  console.log('ctx.canvas.dataset.data',$.type(ctx.canvas.dataset.data));
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: JSON.parse(ctx.canvas.dataset.data),
    options: {
      responsive: true,
      plugins: {
        legend: {
          position: 'top',
        }
      }
    },
  });


});