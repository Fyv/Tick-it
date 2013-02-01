
<%@ page import="com.tickit.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main_full">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span2 well">
			<ul class="nav nav-list">
				<li class="nav-header">Navigation</li>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message
							code="default.home.label" /></a></li>
				<li><g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			</ul>
		</div>
		<div class="span10">
			<div id="list-user" class="content scaffold-list" role="main">
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>

				<table class="table table-striped table-hover table-condensed">
					<thead>
						<tr>

							<g:sortableColumn property="username"
								title="${message(code: 'user.username.label', default: 'Username')}" />

							<g:sortableColumn property="accountExpired"
								title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />

							<g:sortableColumn property="accountLocked"
								title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />

							<g:sortableColumn property="enabled"
								title="${message(code: 'user.enabled.label', default: 'Enabled')}" />

							<g:sortableColumn property="passwordExpired"
								title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />

							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${userInstanceList}" status="i" var="userInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${userInstance.id}">
										${fieldValue(bean: userInstance, field: "username")}
									</g:link></td>

								<td><g:formatBoolean
										boolean="${userInstance.accountExpired}" /></td>

								<td><g:formatBoolean
										boolean="${userInstance.accountLocked}" /></td>

								<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>

								<td><g:formatBoolean
										boolean="${userInstance.passwordExpired}" /></td>

								<td class="link">
									<div class="btn-group">
										<g:link class="btn btn-primary" action="show"
											id="${userInstance?.id}">
											<i class="icon-search"></i>
											<g:message code="default.button.show.label" default="Show" />
										</g:link>
										<button class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown">
											<span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><g:link action="edit" id="${userInstance.id}">
													<g:message code="default.button.edit.label" default="Edit" />
												</g:link></li>
										</ul>
									</div>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${userInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>





</body>
</html>
