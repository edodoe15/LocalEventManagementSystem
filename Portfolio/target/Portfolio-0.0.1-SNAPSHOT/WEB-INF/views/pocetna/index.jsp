<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <title>Portfolio</title>

  <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/assets/favicon.png" />">

  <link rel="stylesheet" href="<c:url value="/plugins/bootstrap/bootstrap.min.css" />">
  <link rel="stylesheet" href="<c:url value="/plugins/slick/slick.css" />">
  <link rel="stylesheet" href="<c:url value="/plugins/themify-icons/themify-icons.css" />">
  <link rel="stylesheet" href="<c:url value="/css/style.css" />">

</head>
<body>
  

<header class="navigation fixed-top">
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand font-tertiary h3" href="<c:url value="/" />">
    	<img src="<c:url value="/assets/logo.png" />" alt="MVC Test">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
      aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse text-center" id="navigation">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="<c:url value="/" />">Početna</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<c:url value="/kontakt" />">Kontakt</a>
        </li>
      </ul>
    </div>
  </nav>
</header>

<section class="hero-area bg-primary" id="parallax">
  <div class="container">
    <div class="row">
      <div class="col-lg-11 mx-auto">
        <h1 class="text-white font-tertiary">Pozdrav, Ja sam <br> ${portfolio.korisnik.ime} ${portfolio.korisnik.prezime}  <br> ${portfolio.korisnik.zanimanje} </h1>
      </div>
    </div>
  </div>
  <div class="layer-bg w-100">
    <img class="img-fluid w-100" src="<c:url value="assets/illustrations/leaf-bg.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l2">
    <img src="<c:url value="/assets/illustrations/dots-cyan.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l3">
    <img src="<c:url value="/assets/illustrations/leaf-orange.png" />" src="images/i" alt="bg-shape">
  </div>
  <div class="layer" id="l4">
    <img src="<c:url value="/assets/illustrations/dots-orange.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l5">
    <img src="<c:url value="/assets/illustrations/leaf-yellow.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l6">
    <img src="<c:url value="/assets/illustrations/leaf-cyan.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l7">
    <img src="<c:url value="/assets/illustrations/dots-group-orange.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l8">
    <img src="<c:url value="/assets/illustrations/leaf-pink-round.png" />" alt="bg-shape">
  </div>
  <div class="layer" id="l9">
    <img src="<c:url value="/assets/illustrations/leaf-cyan-2.png" />" alt="bg-shape">
  </div>
  <ul class="list-unstyled ml-5 mt-3 position-relative zindex-1">
    <li class="mb-3"><a class="text-white" href="https://ptf.unze.ba/"><i class="ti-facebook"></i></a></li>
    <li class="mb-3"><a class="text-white" href="https://ptf.unze.ba/"><i class="ti-instagram"></i></a></li>
    <li class="mb-3"><a class="text-white" href="https://ptf.unze.ba/"><i class="ti-dribbble"></i></a></li>
    <li class="mb-3"><a class="text-white" href="https://ptf.unze.ba/"><i class="ti-twitter"></i></a></li>
  </ul>
</section>
<c:if test="${portfolio.korisnik.opis != null && !portfolio.korisnik.opis.isEmpty()}">
	<section class="section">
	  <div class="container">
	    <div class="row">
	      <div class="col-lg-10 mx-auto text-center">
	        <p class="font-secondary paragraph-lg text-dark">${portfolio.korisnik.opis}</p>
	      </div>
	    </div>
	  </div>
	</section>
</c:if>

<c:if test="${portfolio.vjestine != null && !portfolio.vjestine.isEmpty()}">
	<section class="section">
	  <div class="container">
	    <div class="row">
	      <div class="col-lg-12 text-center">
	        <h2 class="section-title">Vještine</h2>
	      </div>
	      
	      <c:forEach items="${portfolio.vjestine}" var="vjestina">
		      <div class="col-lg-3 col-sm-6 mb-4 mb-lg-0">
		        <div class="card shadow text-center">
		          <div class="position-relative rounded-top progress-wrapper" data-color="#fdb157">
		            <div class="wave" data-progress="90%"></div>
		          </div>
		          <div class="card-footer bg-white">
		            <h4 class="card-title">${vjestina.naziv} (${vjestina.procenatZnanja} %)</h4>
		          </div>
		        </div>
		      </div>
	      </c:forEach>
	    </div>
	  </div>
	</section>
</c:if>

<c:if test="${portfolio.iskustva != null && !portfolio.iskustva.isEmpty()}">
	<section class="section">
	  <div class="container">
	    <div class="row justify-content-around">
	      <div class="col-lg-12 text-center">
	        <h2 class="section-title">Iskustva</h2>
	      </div>
	      
	       <c:forEach items="${portfolio.iskustva}" var="iskustvo">
		      <div class="col-lg-3 col-md-4 text-center">
		        <img src="<c:url value="/assets/experience/icon-1.png" />" alt="icon">
		        <p class="mb-0">${iskustvo.datumOd} - ${iskustvo.datumDo}</p>
		        <h4>${iskustvo.naslov}</h4>
		        <h6 class="text-light">${iskustvo.nazivOrganizacije}</h6>
		      </div>
	       </c:forEach>
	    </div>
	  </div>
	</section>
</c:if>

<c:if test="${portfolio.obrazovanja != null && !portfolio.obrazovanja.isEmpty()}">
	<section class="section position-relative">
	  <div class="container">
	    <div class="row">
	      <div class="col-lg-12 text-center">
	        <h2 class="section-title">Obrazovanje</h2>
	      </div>
	      
	      <c:forEach items="${portfolio.obrazovanja}" var="obrazovanje">
		      <div class="col-lg-6 col-md-6 mb-80">
		        <div class="d-flex">
		          <div class="mr-lg-5 mr-3">
		            <i class="ti-medall icon icon-light icon-bg bg-white shadow rounded-circle d-block"></i>
		          </div>
		          <div>
		            <p class="text-dark mb-1">${obrazovanje.godina}</p>
		            <h4>${obrazovanje.naslov}</h4>
		            <p class="mb-0 text-light">${obrazovanje.nazivInstitucije}</p>
		          </div>
		        </div>
		      </div>
	      </c:forEach>
	    </div>
	  </div>
	  <img class="img-fluid edu-bg-image w-100" 
	    src="<c:url value="/assets/backgrounds/education-bg.png" />" alt="bg-image">
	</section>
</c:if>

<c:if test="${portfolio.usluge != null && !portfolio.usluge.isEmpty()}">
	<section class="section">
	  <div class="container">
	    <div class="row">
	      <div class="col-12 text-center">
	        <h2 class="section-title">Usluge</h2>
	      </div>
	      
	      <c:forEach items="${portfolio.usluge}" var="usluga">
		      <div class="col-md-4 mb-4 mb-md-0">
		        <div class="card hover-shadow shadow">
		          <div class="card-body text-center px-4 py-5">
		            <i class="ti-palette icon mb-5 d-inline-block"></i>
		            <h4 class="mb-4">${usluga.naslov }</h4>
		            <p>${usluga.opis }</p>
		          </div>
		        </div>
		      </div>
	      </c:forEach>
	    </div>
	  </div>
	</section>
</c:if>

<c:if test="${portfolio.projekti != null && !portfolio.projekti.isEmpty()}">
	<section class="section">
	  <div class="container">
	    <div class="row">
	      <div class="col-12 text-center">
	        <h2 class="section-title">Projekti</h2>
	      </div>
	    </div>
	    <div class="row shuffle-wrapper">
	    <c:forEach items="${portfolio.projekti}" var="projekat">
		      <div class="col-lg-4 col-6 mb-4 shuffle-item">
		        <div class="position-relative rounded hover-wrapper">
		          <img src="<c:url value="/assets/portfolio/item-1.png" />" alt="portfolio-image" class="img-fluid rounded w-100">
		          <div class="hover-overlay">
		            <div class="hover-content">
		              <a class="btn btn-light btn-sm" href="#!">pogledaj projekat</a>
		            </div>
		          </div>
		        </div>
		      </div>
	      </c:forEach>
	    </div>
	  </div>
	</section>
</c:if>

<c:if test="${portfolio.svjedocanstva != null && !portfolio.svjedocanstva.isEmpty()}">
	<section class="section bg-primary position-relative testimonial-bg-shapes">
	  <div class="container">
	    <div class="row">
	      <div class="col-12 text-center">
	        <h2 class="section-title text-white mb-5">Svjedočanstva</h2>
	      </div>
	      <div class="col-lg-10 mx-auto testimonial-slider">
		  <c:forEach items="${portfolio.svjedocanstva}" var="svjedocanstvo">
		        <div class="text-center testimonial-content">
		          <i class="ti-quote-right text-white icon mb-4 d-inline-block"></i>
		          <p class="text-white mb-4">${svjedocanstvo.poruka}</p>
		          <img class="img-fluid rounded-circle mb-4 d-inline-block" src="<c:url value="/assets/testimonial/client-1.png" />"
		            alt="client-image">
		          <h4 class="text-white">${svjedocanstvo.osoba }</h4>
		          <h6 class="text-light mb-4">${svjedocanstvo.titula }</h6>
		        </div>
	        </c:forEach>
	      </div>
	    </div>
	  </div>
	
	  <img src="<c:url value="/assets/backgrounds/map.png" />" alt="map" class="img-fluid bg-map">
	  <img src="<c:url value="/assets/illustrations/dots-group-v.png" />" alt="bg-shape" class="img-fluid bg-shape-1">
	  <img src="<c:url value="/assets/illustrations/leaf-orange.png" />" alt="bg-shape" class="img-fluid bg-shape-2">
	  <img src="<c:url value="/assets/illustrations/dots-group-sm.png" />" alt="bg-shape" class="img-fluid bg-shape-3">
	  <img src="<c:url value="/assets/illustrations/leaf-pink-round.png" />" alt="bg-shape" class="img-fluid bg-shape-4">
	  <img src="<c:url value="/assets/illustrations/leaf-cyan.png" />" alt="bg-shape" class="img-fluid bg-shape-5">
	</section>

</c:if>

<section class="section pb-0">
  <div class="container">
    <div class="client-logo-slider d-flex align-items-center">
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-1.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-2.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-3.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-4.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-5.png" />"alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-1.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-2.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-3.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-4.png" />" alt="client-logo"></a>
      <a href="contact.html" class="text-center d-block outline-0 p-4"><img class="d-unset img-fluid"
          src="<c:url value="/assets/clients-logo/client-logo-5.png" />" alt="client-logo"></a>
    </div>
  </div>
</section>

<footer class="bg-dark footer-section">
  <div class="section">
    <div class="container">
      <div class="row">
        
        <c:if test="${portfolio.korisnik.email != null && !portfolio.korisnik.email.isEmpty()}">
        	<div class="col-md-4">
	          <h5 class="text-light">Email</h5>
	          <p class="text-white paragraph-lg font-secondary">${portfolio.korisnik.email}</p>
	        </div>
        </c:if>
        <c:if test="${portfolio.korisnik.telefon != null && !portfolio.korisnik.telefon.isEmpty()}">
	        <div class="col-md-4">
	          <h5 class="text-light">Telefon</h5>
	          <p class="text-white paragraph-lg font-secondary">${portfolio.korisnik.telefon}</p>
	        </div>
        </c:if>
        <c:if test="${portfolio.korisnik.adresa != null && !portfolio.korisnik.adresa.isEmpty()}">
	        <div class="col-md-4">
	          <h5 class="text-light">Adresa</h5>
	          <p class="text-white paragraph-lg font-secondary">${portfolio.korisnik.adresa}</p>
	        </div>
        </c:if>
      </div>
    </div>
  </div>
  <div class="border-top text-center border-dark py-5">
    <p class="mb-0 text-light">Copyright &copy;
       ${trenutnaGodina}
       Designed &amp; Developed by <a class="text-white-50" href="Themefisher">Themefisher</a>
    </p>
  </div>
</footer>


<script src="<c:url value="/js/plugins/jQuery/jquery.min.js" />"></script>
<script src="<c:url value="/js/plugins/bootstrap/bootstrap.min.js" />"></script>
<script src="<c:url value="/js/plugins/slick/slick.min.js" />"></script>
<script src="<c:url value="/js/plugins/shuffle/shuffle.min.js" />"></script>
<script src="<c:url value="/js/script.js" />"></script>

</body>
</html>
