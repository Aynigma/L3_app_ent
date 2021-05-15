<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evènement</title>
<jsp:include page="head.jsp" />
</head>
<body>
<jsp:include page="navbar.jsp" />

<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding:64px 16px">
  <h1 class="w3-margin w3-jumbo"><c:out value="${event.name }" /></h1>
  <p class="w3-xlarge"></p>
  <p class="w3-xlarge"></p>
</header>


<c:if test="${user != null && user.isAdmin}">
  <div class="w3-content w3-center">
        <form method="GET" action="/admin/editevent" style="display:inline;">
            <input type="hidden" id="id" name="id" value="<c:out value="${event.id}"/>"/>
            <input type="submit" value="Editer l'évènement" class="w3-button w3-red w3-padding-large w3-large w3-margin-top">
        </form>
        <form method="GET" action="/admin/deleteevent" style="display:inline;">
            <input type="hidden" id="id" name="id" value="<c:out value="${event.id}"/>"/>
            <input type="submit" value="Supprimer l'évènement" class="w3-button w3-red w3-padding-large w3-large w3-margin-top">
        </form>
    </div>
</c:if>

<div class="w3-row-padding w3-padding-64 w3-container">
        <div class="w3-content">
            <div class="w3-container w3-center w3-third">
                <p class="w3-xlarge"><c:out value="${event.tags }" /></p>
                <h3>Lieu : <c:out value="${event.location }" /></h3>
                <h3>Date : <fmt:formatDate type = "date" value = "${event.date}" /></h3>
                <label>Prix : <c:out value="${event.price == 0 ? 'Gratuit' : event.price}" /><c:if test="${event.price > 0}">&euro;</c:if></label>

            </div>
            <div class="w3-container w3-center w3-twothird">
                <p class="w3-xlarge"><c:out value="${event.subtitle }" /></p>
                <p><c:out value="${event.description}" /></p>
            </div>
        </div>
    </div>
    <br>



<header class="w3-container w3-red w3-center" style="padding:32px 16px">
  <h1 class="w3-margin w3-jumbo">Reserver des places</h1>
  <c:if test="${user != null}">
  <p class="w3-xlarge">Veuillez remplir les champs ci-dessous :</p>
  </c:if>
  <c:if test="${user == null && !user.isAdmin}">
  <p class="w3-xlarge">Veuillez vous <a href="/login">connecter</a> pour réserver des tickets :</p>
  </c:if>
</header>

<c:if test="${user != null}">
<div class="w3-container w3-center">
<form method="POST" class="form-horizontal">
	<input type="hidden" id="id" name="id" value="<c:out value="${event.id}"/>"/>
	<br>
	<c:if test="${!user.isAdmin}">
	<label for="amount">Quantité :</label>
	<input type="number" id="amount" name="amount" value="1" min="1"/>
	</c:if>
	
	<div style="text-align: left; padding-left: 42%;">
      <h3>Tarif :</h3>
      
      <c:if test="${event.tariffChildAvailable}">
      <input type="radio" id="tarif-child" name="tarif" value="tarif-child">
      <label for="tarif-child">Enfant (-12 ans, -50%)</label><br>
      </c:if>
      
      <c:if test="${event.tariffYoungAvailable}">
      <input type="radio" id="tarif-young" name="tarif" value="tarif-young">
      <label for="tarif-young">Jeune (12-25 ans, -25%)</label><br>
      </c:if>
      
      <input type="radio" id="tarif-default" name="tarif" value="tarif-default" checked>
      <label for="tarif-default">Normal</label><br>
      
      <c:if test="${event.tariffSeniorAvailable}">
      <input type="radio" id="tarif-senior" name="tarif" value="tarif-senior">
      <label for="tarif-senior">Senior (65+ ans, -30%)</label><br>
      </c:if>
      
      <c:if test="${event.tariffVIPAvailable}">
      <input type="checkbox" id="vip" name="vip" value="vip">
      <label for="vip">VIP (+50%)</label><br>
      </c:if>
    </div>
    <c:if test="${user != null && !user.isAdmin}">
	<input type="submit" value="Ajouter au panier" class="w3-button w3-red w3-padding-large w3-large w3-margin-top"/>
	</c:if>
</form>
</div>
</c:if>

<br>
<br>
<br>
</body>
</html>