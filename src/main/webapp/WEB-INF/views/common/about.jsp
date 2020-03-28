<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<style>


* {
	box-sizing: border-box;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1200px;
  position: relative;
  margin: auto;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #56baed;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade1 {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 4s;
}

@-webkit-keyframes fade1 {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade1 {
  from {opacity: .4} 
  to {opacity: 1}
}


</style>
<div>
<div class="slideshow-container">
<h5 style="white-space:pre;">
'머무르다' 는 부산의 부산에 의한 부산을 위한 숙박공유 서비스입니다.

부산에 거주하고 있는 분이라면, 부산에 여행하고 싶은 분이라면

'머무르다' 와 함께 해보시면 어떨까요?

</h5>

<div class="mySlides fade1">
  <img src="${path}/resources/img/busan1.png" style="width:100%;">
</div>

<div class="mySlides fade1">
  <img src="${path}/resources/img/busan2.png" style="width:100%;">
</div>

<div class="mySlides fade1">
  <img src="${path}/resources/img/busan3.png" style="width:100%;">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); 
}
</script>
<%@ include file="footer.jsp" %>