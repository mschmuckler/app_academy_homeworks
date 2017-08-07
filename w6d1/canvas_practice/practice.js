document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  var ctx = canvas.getContext('2d');

  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(10, 10, 100, 100);

  ctx.beginPath();
  ctx.arc(50, 50, 50, 0, 2 * Math.PI, false);
  ctx.stroke();
  ctx.fillStyle = 'rgb(150,50,0)';
  ctx.fill();
});
