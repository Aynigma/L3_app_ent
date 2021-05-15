<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Editer evenement</title>
<jsp:include page="head.jsp" />
</head>

<body>
<jsp:include page="navbar.jsp"/>

<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding:64px 16px">
  <h1 class="w3-margin w3-jumbo">Editer un evenement</h1>
  <p class="w3-xlarge">Veuillez saisir les informations :</p>
</header>

<div class="w3-container w3-center">
<form  method="POST" class="form-horizontal">
	
	<c:if test="${event.id != null}">
		<input type="hidden" id="id" name="id" value="0"/>
	</c:if>
	<br>
	<div class="form-group">
	<label for="name">Titre</label>
	<input type="text" id="name" name="name" value="<c:out value="${event.name}"/>" placeholder="Titre" autofocus />
	</div><br>
	<div class="form-group">
	<label for="subtitle">Sous titre</label>
	<input type="text" id="subtitle" name="subtitle" value="<c:out value="${event.subtitle}"/>" placeholder="Sous titre" />
	</div><br>
	<div class="form-group">
	<label for="location">Lieu</label>
	<input type="text" id="location" name="location" value="<c:out value="${event.location}"/>" placeholder="Lieu" />
	</div><br>
	<div class="form-group">
	<label for="date">Date</label>
	<input type="date" id="date" name="date" value="<c:out value="${event.getFormatedDateValue()}"/>" />
	</div><br>
	<div class="form-group">
	<label for="description">Description</label>
	<input type="text" id="description" name="description" value="<c:out value="${event.description}"/>" placeholder="Description" />
	</div><br>
	<div class="form-group">
	<label for="tags">Tags</label>
	<input type="text" id="tags" name="tags" value="<c:out value="${event.tags}"/>" placeholder="Tags" />
	</div><br>
	<div class="form-group">
	<label for="price">Prix</label>
	<input type="number" id="price" name="price" min="0" step="0.01" value="<c:out value="${event.price}"/>" />
	</div><br>
	


	
	<div style="text-align: left; padding-left: 42%;">
      <h3>Tarifs disponibles :</h3>
      <input type="checkbox" id="tariff_child" name="tariff_child" value="tariff_child" <c:out value="${event.tariffChildAvailable ? 'checked' : ''}"/>>
      <label for="tariff_child">Enfant (-12 ans, -50%)</label><br>
      
      <input type="checkbox" id="tariff_young" name="tariff_young" value="tariff_young" <c:out value="${event.tariffYoungAvailable ? 'checked' : ''}"/>>
      <label for="tariff_young">Jeune (12-25 ans, -25%)</label><br>
      
      <input type="checkbox" id="tariff_senior" name="tariff_senior" value="tariff_senior" <c:out value="${event.tariffSeniorAvailable ? 'checked' : ''}"/>>
      <label for="tariff_senior">Senior (65+ ans, -30%)</label><br>
      
      <input type="checkbox" id="tariff_vip" name="tariff_vip" value="tariff_vip" <c:out value="${event.tariffVIPAvailable ? 'checked' : ''}"/>>
      <label for="tariff_vip">VIP (+50%)</label><br>
    </div>

	<div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="w3-button w3-red w3-padding-large w3-large w3-margin-top">Valider</button>
      </div>
	</div>
</form>
</div>

</body>
</html>