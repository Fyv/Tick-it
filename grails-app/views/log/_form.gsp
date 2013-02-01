<%@ page import="com.tickit.Log" %>



<div class="fieldcontain ${hasErrors(bean: logInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="log.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${logInstance?.description}"/>
</div>

