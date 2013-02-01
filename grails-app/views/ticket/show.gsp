
<%@ page import="com.tickit.Ticket"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main_full">
<g:set var="entityName"
	value="${message(code: 'ticket.label', default: 'Ticket')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-ticket" class="container" role="main">
		<div class="row">
			<div class="span8">
				<div class="page-header">
					<g:if test="${ticketInstance?.title}">

						<h1 class="property-value" aria-labelledby="title-label">
							<g:fieldValue bean="${ticketInstance}" field="title" />
						</h1>

					</g:if>
				</div>
				<div class="well">
					<g:if test="${flash.message}">
						<div class="message" role="status">
							${flash.message}
						</div>
					</g:if>
					<div>
						<g:if test="${ticketInstance?.priority}">
							<em> <span id="priority-label" class="property-label"><g:message
										code="ticket.priority.label" default="Priority" /></span> <span
								class="property-value" aria-labelledby="priority-label"><g:fieldValue
										bean="${ticketInstance}" field="priority" /></span>
							</em>

						</g:if>
						<g:if test="${ticketInstance?.dateCreated}">
							<em><span>Crée le</span> <span class="property-value"
								aria-labelledby="dateCreated-label"><g:formatDate
										format="dd-MM-yyyy" date="${ticketInstance?.dateCreated}" /></span>
							</em>
						</g:if>

						<g:if test="${ticketInstance?.lastUpdated}">
							<em> <span> - Maj le</span> <span class="property-value"
								aria-labelledby="lastUpdated-label"><g:formatDate
										format="dd-MM-yyyy" date="${ticketInstance?.lastUpdated}" /></span>
							</em>
						</g:if>
						<hr />
					</div>
					<div>
						<g:if test="${ticketInstance?.description}">
							<span class="property-value" aria-labelledby="description-label"><g:fieldValue
									bean="${ticketInstance}" field="description" /></span>

						</g:if>
					</div>
					<hr>
					<div>
						<g:form>
							<fieldset class="buttons">
								<g:hiddenField name="id" value="${ticketInstance?.id}" />
								<g:link class="edit" action="edit" id="${ticketInstance?.id}">
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
			<div class="span3 ">
				<div class="page-header">
					<g:if test="${ticketInstance?.title}">
						<h1 class="property-value" aria-labelledby="title-label">
							<g:message code="ticket.logs.label" default="Logs" />
						</h1>

					</g:if>
				</div>
				<div class="well">
					<g:if test="${ticketInstance?.logs}">
						<g:each in="${ticketInstance.logs}" var="l">
							<p class="muted">
								<small> Le <g:formatDate format="dd-MM-yyyy"
										date="${l?.dateCreated}" />
										Par 
										${l?.user.username }
								</small>
							</p>
							<p>
								${l?.description}
							</p>
						</g:each>
					</g:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
