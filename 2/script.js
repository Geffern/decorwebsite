var slideIndex = 1;
var timeoutId;
showSlides(slideIndex);

function plusSlides(n) {
  // slideIndex+=n;
  showSlides();
}

function currentSlide(n) {
  slideIndex = n;
  showSlides(true);
}


function showSlides(stay=false) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    if( timeoutId )
    	clearTimeout(timeoutId);

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none"; 
    }
    if(!stay) slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1} 
    slides[slideIndex-1].style.display = "block"; 
    timeoutId = setTimeout((function(slideIndex){
    	console.log("slideIndex:", slideIndex)
    	return showSlides;
    })(slideIndex), 4000); // Change image every 3 seconds
}