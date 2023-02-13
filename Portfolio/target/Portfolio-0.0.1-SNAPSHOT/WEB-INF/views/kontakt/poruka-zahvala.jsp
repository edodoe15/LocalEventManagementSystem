<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <title>Hvala na poruci - Portfolio</title>

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
        <h1 class="text-white font-tertiary">
        	${zahvala} 
        </h1>
       
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

<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-title"><a href="<c:url value="/" />">Vrati se nazad</a></h2>
      </div>
    </div>
  </div>
</section>

<footer class="bg-dark footer-section">
  <div class="section">
    <div class="container">
      <div class="row">
        
        <c:if test="${korisnik.email != null && !korisnik.email.isEmpty()}">
        	<div class="col-md-4">
	          <h5 class="text-light">Email</h5>
	          <p class="text-white paragraph-lg font-secondary">${korisnik.email}</p>
	        </div>
        </c:if>
        <c:if test="${korisnik.telefon != null && !korisnik.telefon.isEmpty()}">
	        <div class="col-md-4">
	          <h5 class="text-light">Telefon</h5>
	          <p class="text-white paragraph-lg font-secondary">${korisnik.telefon}</p>
	        </div>
        </c:if>
        <c:if test="${korisnik.adresa != null && !korisnik.adresa.isEmpty()}">
	        <div class="col-md-4">
	          <h5 class="text-light">Adresa</h5>
	          <p class="text-white paragraph-lg font-secondary">${korisnik.adresa}</p>
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
