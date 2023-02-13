<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Events</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>

<!-- Add Navigation -->
<%@ include file="../navigation.jsp" %>

<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>Welcome, ${pageContext.request.userPrincipal.name}</h2>
    </c:if>
</div>

<!-- Only ADMIN can access these urls -->
<security:authorize access="hasRole('ADMIN')">
     <button class="btn btn-primary">
        <a class="nav-link" href="<c:url value="/dogadaj/add3" />">Add New Event</a>
    </button>
</security:authorize>

    <h2>Dogadaji</h2>
    <form:form action="${pageContext.request.contextPath}/dogadaj/search" method="POST" modelAttribute="dogadaj" class="row">
        <div class="input-group">
          <div class="form-group">
            <form:input type="text" path="nazivDogadaja" placeholder="Naziv" class="form-control px-0 mb-4" required="required" />
          </div>
          <div class="form-group">
              <form:select class="form-select" path="kategorijaId">
              <c:forEach items="${kategorije}" var="kategorija">
                  <form:option value="${kategorija.id}">${kategorija.nazivKategorije}</form:option>
              </c:forEach>
              </form:select>
            </div>

            <div class="form-group">
            <form:select class="form-select" path="lokacijaId">
              <c:forEach items="${lokacije}" var="lokacija">
                  <form:option value="${lokacija.id}">${lokacija.naziv}</form:option>
              </c:forEach>
              </form:select>
            </div>
            <div class="form-group">
          <button type="submit" class="btn btn-primary">Search</button>
          </div>
          </div>
          </form:form>



    <table class="table">
      <thead>
           <tr>
             <th>Naziv</th>
             <th>Datum</th>
             <th>Opis</th>
             <th>Slika</th>
             <th>Lokacija</th>
             <th>Kategorija</th>
             <th></th>
          </tr>
      </thead>
            <tbody>
                <c:forEach items="${dogadaji}" var="dogadaj">
                    <tr>
                       <td>${dogadaj.nazivDogadaja}</td>
                       <td>${dogadaj.datum}</td>
                       <td>${dogadaj.opis}</td>
                       <td><img src="${dogadaj.slikaURL}" width="50" height="50"̣/></td>
                       <td>${dogadaj.lokacija.naziv}</td>
                       <td>${dogadaj.kategorija.nazivKategorije}</td>
                       <td><p> <a class="nav-link" href="<c:url value="/dogadaj/update3/${dogadaj.id}"/>">Azuriraj</a></p></td>
                    </tr>
                </c:forEach>
            </tbody>
    </table>
</body>
</html>