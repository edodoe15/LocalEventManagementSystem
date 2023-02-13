<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Event</title>
   <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>

<!-- Add Navigation -->
<%@ include file="../navigation.jsp" %>

<section class="section section-on-footer" data-background="<c:url value="/assets/backgrounds/bg-dots.png" />">
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h2 class="section-title">New Event</h2>
      </div>
      <div class="col-lg-8 mx-auto">
        <div class="bg-white rounded p-5 shadow-down">
            <form:form action="${pageContext.request.contextPath}/dogadaj/add3" method="POST" modelAttribute="dogadaj" class="row">
             <div class="form-group">
                <label for="exampleInputEmail1">Name:</label>
                <form:input type="text" path="nazivDogadaja" class="form-control px-0 mb-4" required="required" />
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Date:</label>
              <form:input type="text" path="datum" class="form-control px-0 mb-4" required="required" />
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">Description:</label>
                <form:input type="text" path="opis" class="form-control px-0 mb-4" required="required" />
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">Image Link:</label>
                <form:input type="text" path="slikaURL" class="form-control px-0 mb-4" required="required" />
              </div>

              <div class="form-group">
                 <label for="exampleInputPassword1">Category:</label>
                <form:select class="form-select" path="kategorijaId">
                <c:forEach items="${kategorije}" var="kategorija">
                    <form:option value="${kategorija.id}">${kategorija.nazivKategorije}</form:option>
                </c:forEach>
                </form:select>
              </div>

              <div class="form-group">
               <label for="exampleInputPassword1">Location:</label>
              <form:select class="form-select" path="lokacijaId">
                <c:forEach items="${lokacije}" var="lokacija">
                    <form:option value="${lokacija.id}">${lokacija.naziv}</form:option>
                </c:forEach>
                </form:select>
              </div>

              <button type="submit" class="btn btn-primary">Add</button>
          </form:form>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>