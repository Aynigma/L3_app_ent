<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administration</title>
<jsp:include page="head.jsp" />
</head>

<body>
	<jsp:include page="navbar.jsp" />

	<!-- Header -->
	<header class="w3-container w3-red w3-center"
		style="padding: 128px 16px">
		<h1 class="w3-margin w3-jumbo">Administration</h1>
		<p class="w3-xlarge">Gerez le site ici !</p>
	</header>
	
	<div class="w3-center">
		<p><a href="/admin/editevent" class="w3-button w3-red w3-padding-large w3-large w3-margin-top">Créer un nouvel évènement</a></p>
		<p>Nombre d'évènements proposés : <c:out value="${numberOfEvents}"/></p>
		<p>Nombre de billets vendus : <c:out value="${numberOfTickets}"/></p>
		<p>Bénéfices totaux : <c:out value="${totalPrice}"/> &euro;</p>
	</div>
</body>
</html>