// all this for product menu?



var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");

btn.onclick = function() {
  modal.style.display = "block";
  document.getElementById('btn1').classList.remove('invis');
  document.getElementById('btn1').classList.add('animated');
  document.getElementById('btn1').classList.add('bounceInDown');

  setTimeout(function() {
    document.getElementById('btn2').classList.remove('invis');
    document.getElementById('btn2').classList.add('animated');
    document.getElementById('btn2').classList.add('bounceInDown');
  }, 200);

  setTimeout(function() {
    document.getElementById('btn3').classList.remove('invis');
    document.getElementById('btn3').classList.add('animated');
    document.getElementById('btn3').classList.add('bounceInDown');
  }, 400);

}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";

    document.getElementById('btn1').classList.add('invis');
    document.getElementById('btn1').classList.remove('animated');
    document.getElementById('btn1').classList.remove('bounceInDown');

    document.getElementById('btn2').classList.add('invis');
    document.getElementById('btn2').classList.remove('animated');
    document.getElementById('btn2').classList.remove('bounceInDown');

    document.getElementById('btn3').classList.add('invis');
    document.getElementById('btn3').classList.remove('animated');
    document.getElementById('btn3').classList.remove('bounceInDown');

  }

}



//this is for the 'about' slideshow

var slideIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1}
    x[slideIndex-1].style.display = "block";
    setTimeout(carousel, 2000);
}
