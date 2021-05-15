<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navbar -->
<div class="w3-top">
	<div class="w3-bar w3-red w3-card w3-left-align w3-large">
		<a href="/"
			class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Accueil</a>


		<!-- test user is connected -->
		<c:if test="${user != null}">
			<!-- test if user is an admin -->
			<c:if test="${user.isAdmin}">
				<a href="/admin"
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Administration</a>
			</c:if>

			<!-- cart -->
			<c:if test="${!user.isAdmin}">
				<a href="/cart"
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">
					Panier <c:if test="${cart != null && cart.size() > 0}">
						(<c:out value="${cart.size()}" />)
					</c:if>
				</a>
			</c:if>


			<a href="/logout"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				style="float: right;">Se déconnecter</a>
		</c:if>
		<c:if test="${user == null}">
			<a href="/login"
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
				style="float: right;">Se connecter</a>
		</c:if>

	</div>
</div>