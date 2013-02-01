<%@ page import="com.tickit.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="ticket.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${ticketInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="ticket.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea  name="description" required="" value="${ticketInstance?.description}"  rows="5" class="field span6" />
</div>

<div>
	<label>Intervention : </label>
	<g:textArea name="intervention" value="" rows="5" class="field span6" />
</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="ticket.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="priority" from="${com.domain.enums.Priority?.values()}" keys="${com.domain.enums.Priority.values()*.name()}" required="" value="${ticketInstance?.priority?.name()}"/>
</div>

