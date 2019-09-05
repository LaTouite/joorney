var comingdate = new Date("September 20, 2019 00:00:00");

var d = document.getElementById('d');
var h = document.getElementById('h');
var m = document.getElementById('m');
var s = document.getElementById('s');

let x;

function getTrueNumber(x) {
  if (x<10) return '0'+x;
  else return x;
}

function display(){
  var now = new Date();
  var des = comingdate.getTime() - now.getTime();
  var days = Math.floor(des/(1000 * 60 * 60 * 24));
  var hours = Math.floor(des%(1000 * 60 * 60 * 24) / (1000 * 60 *60));
  var mins = Math.floor(des%(1000 * 60 * 60) / (1000 * 60));
  var secs = Math.floor(des%(1000 * 60) / 1000);

  d.innerHTML = getTrueNumber(days);
  h.innerHTML = getTrueNumber(hours);
  m.innerHTML = getTrueNumber(mins);
  s.innerHTML = getTrueNumber(secs);

  if(des <= 0) clearInterval(x);
}

function initCountdown(){
  x = setInterval(display,1000);
}

// mycode
export { initCountdown };
