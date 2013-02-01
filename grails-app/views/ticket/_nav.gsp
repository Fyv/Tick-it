<%@ page import="com.tickit.Ticket"%>

<ul class="nav nav-list">
	<li class="nav-header">Navigation</li>
	<li><g:link controller="ticket">
			<g:message code="default.home.label" />
		</g:link>
	<li><g:link class="show" action="listByUser">
			<g:message code="default.listByUser.label" args="[entityName]" />
		</g:link></li>
	<li><g:link class="create" action="create">
			<g:message code="default.new.label" args="[entityName]" />
		</g:link></li>
</ul>