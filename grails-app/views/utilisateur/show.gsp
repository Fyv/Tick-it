
<%@ page import="com.tickit.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main_full">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-user" class="content scaffold-show" role="main">

		<div class="row">
			<div class="span8">
				<div class="page-header">
					<h1>
						<g:message code="default.show.label" args="[entityName]" />
					</h1>
				</div>
				<div id="show-user" class="content scaffold-show well" role="main">

					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
					<dl>
						<g:if test="${userInstance?.username}">
							<dt id="username-label" class="property-label">
								<g:message code="user.username.label" default="Username" />
							</dt>
							<dd class="property-value" aria-labelledby="username-label">
								<g:fieldValue bean="${userInstance}" field="username" />
							</dd>
						</g:if>

						<g:if test="${userInstance?.password}">
							<dt id="password-label" class="property-label">
								<g:message code="user.password.label" default="Password" />
							</dt>
							<dd class="property-value" aria-labelledby="password-label">
								<g:fieldValue bean="${userInstance}" field="password" />
							</dd>
						</g:if>

						<g:if test="${userInstance?.accountExpired}">
							<dt id="accountExpired-label" class="property-label">
								<g:message code="user.accountExpired.label"
									default="Account Expired" />
							</dt>
							<dd class="property-value" aria-labelledby="accountExpired-label">
								<g:formatBoolean boolean="${userInstance?.accountExpired}" />
							</dd>
						</g:if>

						<g:if test="${userInstance?.accountLocked}">
							<dt id="accountLocked-label" class="property-label">
								<g:message code="user.accountLocked.label"
									default="Account Locked" />
							</dt>
							<dd class="property-value" aria-labelledby="accountLocked-label">
								<g:formatBoolean boolean="${userInstance?.accountLocked}" />
							</dd>
						</g:if>

						<g:if test="${userInstance?.enabled}">
							<dt id="enabled-label" class="property-label">
								<g:message code="user.enabled.label" default="Enabled" />
							</dt>
							<dd class="property-value" aria-labelledby="enabled-label">
								<g:formatBoolean boolean="${userInstance?.enabled}" />
							</dd>
						</g:if>

						<g:if test="${userInstance?.passwordExpired}">
							<dt id="passwordExpired-label" class="property-label">
								<g:message code="user.passwordExpired.label"
									default="Password Expired" />
							</dt>

							<dd class="property-value"
								aria-labelledby="passwordExpired-label">
								<g:formatBoolean boolean="${userInstance?.passwordExpired}" />
							</dd>
						</g:if>

						<g:if test="${userInstance?.authorities }">
							<dt>Role</dt>
							<dd>
								${userInstance?.authorities.authority }
							</dd>
						</g:if>
					</dl>
					<hr />
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${userInstance?.id}" />
							<g:link class="edit" action="edit" id="${userInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="delete" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
