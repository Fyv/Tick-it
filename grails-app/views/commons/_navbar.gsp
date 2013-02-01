<!-- NAVBAR -->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<button data-target=".nav-collapse" data-toggle="collapse"
				class="btn btn-navbar" type="button"></button>
			<a href="./index.html" class="brand">Tick-it</a>
			<div class="nav-collapse collapse">
				<ul class="nav">
					<li
						<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a
						href="${createLink(uri: '/')}">Accueil</a></li>
					<%--<li><g:link controller="ticket">Tickets</g:link></li>--%>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> Tickets <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">

							<li><g:link controller="ticket">
							Tous
								</g:link>
							<li><g:link class="show" action="listByUser">
							Perso
								</g:link></li>
							<li><g:link class="create" action="create">
							Créer
								</g:link></li>
						</ul></li>
					<li><g:link controller="utilisateur">Utilisateurs</g:link></li>

				</ul>

				<sec:ifLoggedIn>
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <sec:username /> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">

								<li><g:link controller="utilisateur">Preferences </g:link></li>
								<li><g:link controller="logout">logout </g:link></li>
							</ul></li>
					</ul>
				</sec:ifLoggedIn>
			</div>
		</div>
	</div>
</div>