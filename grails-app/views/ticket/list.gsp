
<%@page import="javax.validation.constraints.Max"%>
<%@ page import="com.tickit.Ticket"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main_full">
<g:set var="entityName"
	value="${message(code: 'ticket.label', default: 'Ticket')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
		<g:render template="listMain" />
</body>
</html>
