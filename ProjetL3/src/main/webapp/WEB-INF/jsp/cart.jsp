<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Panier</title>
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<!-- Header -->
	<header class="w3-container w3-red w3-center"
		style="padding: 64px 16px">
		<h1 class="w3-margin w3-jumbo">Panier</h1>

		<c:if test="${cart != null && cart.size() >= 1}">
			<p class="w3-xlarge">Confirmez votre panier</p>
		</c:if>
		<c:if test="${cart == null || cart.size() <= 0}">
			<p>
				Votre panier est vide, consulter nos <a href="../">évènements</a>
				pour réserver des places.
			</p>
		</c:if>
	</header>

	<c:if test="${cart != null && cart.size() >= 1}">
	<div class="w3-container w3-center">
		<br>
		<table class="w3-table w3-bordered w3-striped w3-border">
			<tr class="w3-red">
				<th>Evènement</th>
				<th>Type</th>
				<th>VIP</th>
				<th>Quantité</th>
				<th>Prix</th>
				<th style="float: right;">Action</th>
			</tr>
			<c:forEach items="${cart}" var="ticket" varStatus="status">
				<tr>
					<td>
						<a href="/event?id=<c:out value="${ticket.event.id}" />">
							<c:out value="${ticket.event.name}" />
						</a>
					</td>
					<td><c:out value="${ticket.getFormatedType()}" /></td>
										<td><c:out value="${ticket.isVIP ? \"oui\" : \"non\"}" /></td>
					<td><c:out value="${ticket.amount}" /></td>
					<td><c:out value="${ticket.getPrice()}" />&euro;</td>
					<td style="float: right;">
						<form method="POST" action="/cancelticket">
							<input type="hidden" id="id" name="id" value="<c:out value="${status.index}"/>"/> 
							<input type="submit" value="Annuler" class="w3-button w3-red w3-padding-large w3-large w3-margin-top" />
						</form>

					</td>
				</tr>
			</c:forEach>
		</table>

		<form method="POST" action="/buycart">
			<input type="submit" value="Acheter"
				class="w3-button w3-red w3-padding-large w3-large w3-margin-top" />
		</form>
		</div>
	</c:if>

</body>
</html>



