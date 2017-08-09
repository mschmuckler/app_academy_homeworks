console.log("Hello from the JavaScript console!");

$.ajax({
  method: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  dataType: "json",
  data: "weathesdfsdfsdfr",
  success: function(weatherData) {
    console.log(weatherData);
  }
})

// Add another console log here, outside your AJAX request
console.log("End of the line")
