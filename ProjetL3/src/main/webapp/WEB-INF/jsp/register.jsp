<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inscription</title>
<jsp:include page="head.jsp" />
</head>

<body>
	<jsp:include page="navbar.jsp" />

	<!-- Header -->
	<header class="w3-container w3-red w3-center"
		style="padding: 64px 16px">
		<h1 class="w3-margin w3-jumbo">Creer un compe</h1>
		<p class="w3-xlarge">Veuillez saisir vos informations :</p>
	</header>

	<div class="w3-container w3-center">
		<br>
		<form class="form-horizontal" method="POST">
			<!-- Username -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="username">Pseudonyme
					:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="username"
						name="username" placeholder="Votre nom d'utilisateur" autofocus>
				</div>
			</div>
			<br>

			<!-- Password -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">Mot de
					passe :</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Votre mot de passe">
				</div>
			</div>
			<br>
			<!-- Conf Password -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="confpassword">Confirmer
					mot de passe : </label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="confpassword"
						name="confpassword" placeholder="Répétez votre mot de passe">
				</div>
			</div>
			<!-- Login -->
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="login">Déjà un compte ?</a>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">S'enregistrer</button>
				</div>
			</div>
			<c:if test="${error != null }">
				<div class="form-group error">
					<p>
						<c:out value="${error}" />
					</p>
				</div>
			</c:if>

		</form>
		<br>
	</div>
</body>
</html>



