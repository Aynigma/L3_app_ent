<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evenements</title>
<jsp:include page="head.jsp" />
</head>

<body>
	<jsp:include page="navbar.jsp" />

	<!-- Header -->
	<header class="w3-container w3-red w3-center"
		style="padding: 128px 16px">
		<h1 class="w3-margin w3-jumbo">Évènements</h1>

		<p class="w3-xlarge">
			<c:if test="${user != null}">
			Bonjour <c:out value="${user.username}" /> !
			</c:if>
			<c:if test="${user == null}">
				<a href="/login">Connectez-vous</a> pour rejoindre l'un de nos évenements !
			</c:if>
		</p>

		<p class="w3-xlarge">Voici nos évènements à venir !</p>

	</header>

	<div class="w3-container w3-center w3-light-grey">
		<form method="GET" class="form-horizontal">
			<c:if test="${query != null}">
				<input type="text" id="query" name="query" value="${query}" placeholder="Rechercher un évènement" style="width:350px;">
			</c:if>
			<c:if test="${query == null}">
				<input type="text" id="query" name="query" placeholder="Rechercher un évènement" style="width:350px;">
			</c:if>
			<input type="submit" value="Chercher" class="w3-button w3-red w3-padding-large w3-large w3-margin-top w3-margin-bottom"/>
		</form>
	</div>

	<div class="events">
		<c:forEach items="${ListEvent}" var="event" varStatus="loopStatus">
			<c:if test="${loopStatus.index%2==0}">
				<div class="w3-row-padding w3-padding-64 w3-container">
					<div class="w3-content">
						<div class="w3-twothird">
							<h1>
								<c:out value="${event.name}" />
							</h1>
							<h5 class="w3-padding-8">
								<c:out value="${event.tags}" />
							</h5>
							<h5 class="w3-padding-8">
								Le
								<fmt:formatDate type = "date" value = "${event.date}" />
								à
								<c:out value="${event.location}" />
							</h5>
							<p class="w3-text-grey">
								<c:out value="${event.subtitle}" />
							</p>
						</div>

						<div class="w3-third w3-center" style="padding: 128px;">
							<a href="/event?id=<c:out value="${event.id}"/>"
								class="w3-button w3-red w3-padding-large w3-large w3-margin-top">En
								savoir plus</a>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${loopStatus.index%2==1}">
				<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
					<div class="w3-content">
						<div class="w3-third w3-center" style="padding: 128px;">
							<a href="/event?id=<c:out value="${event.id}"/>"
								class="w3-button w3-red w3-padding-large w3-large w3-margin-top">En
								savoir plus</a>
						</div>
						<div class="w3-twothird">
							<h1>
								<c:out value="${event.name}" />
							</h1>
							<h5 class="w3-padding-8">
								<c:out value="${event.tags}" />
							</h5>
							<h5 class="w3-padding-8">
								Le
								<fmt:formatDate type = "date" value = "${event.date}" />
								à
								<c:out value="${event.location}" />
							</h5>
							<p class="w3-text-grey">
								<c:out value="${event.subtitle}" />
							</p>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>

	</div>

</body>
</html>