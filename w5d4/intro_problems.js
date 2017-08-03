function madLib(verb, adjective, noun) {
  return "We shall " + verb + " the " + adjective + " " + noun + ".";
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  var new_array = [];
  for (i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      if (!(array[i] % 3 === 0 && array[i] % 5 === 0)) {
        new_array.push(array[i]);
      }
    }
  }
  return new_array;
}

function isPrime(num) {
  if (num <= 2) {
    return false;
  }

  for (i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  var primes = [];
  var i = 3;
  while (primes.length < n) {
    if (isPrime(i)) {
      primes.push(i);
    }
    i++
  }

  var total = 0;
  for (j = 0; j < primes.length; j++) {
    total = total + primes[j]
  }

  return total;
}

function titleize(array, callbackFxn) {
  let titles = array.map(name => 'Mx. ' + name + ' Jingleheimer Schmidt');
  callbackFxn(titles);
}

titleize(['Sarah', 'Joe'], function(titles) {
  titles.forEach(name => console.log(name));
})

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(this.name + " the elephant goes 'phrRRRRRRRRRRR!!!!!!!'");
}

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
}

Elephant.prototype.addTrick(trick) = function (trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function () {

}


function dinerBreakfast(order) {
  let total_order = "I want eggs"

  function bfastOrder() {
    total_order = total_order + " and " + order
  }

  return total_order
}
