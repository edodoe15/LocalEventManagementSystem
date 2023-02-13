<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
   <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>

<!-- Add Navigation -->
<%@ include file="../navigation.jsp" %>

<!-- Only ADMIN can access these urls -->
<security:authorize access="hasRole('ADMIN')">
     <button class="btn btn-primary">
        <a class="nav-link" href="<c:url value="/kategorija/add2" />">Add New Category</a>
    </button>
</security:authorize>

<h2>Kategorije</h2>
<table class="table">
  <thead>
       <tr>
         <th>Naziv</th>
         <th>Ikona</th>
         <th></th>
      </tr>
  </thead>
        <tbody>
            <c:forEach items="${kategorije}" var="kategorija">
                <tr>
                   <td>${kategorija.nazivKategorije}</td>
                   <td><img src="${kategorija.ikonica}" width="50" height="50"̣/></td>
                   <td><p> <a class="nav-link" href="<c:url value="/kategorija/update/${kategorija.id}"/>">Azuriraj</a></p></td>
                </tr>
            </c:forEach>
        </tbody>
</table>
</body>
</html>