<%@ page import="com.tickit.Utilisateur"%>



<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username"> <g:message code="user.username.label"
			default="Username" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required=""
		value="${userInstance?.username}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password"> <g:message code="user.password.label"
			default="Password" /> <span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" 
		value="${userInstance?.password}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired" class="checkbox"> <g:checkBox
			name="accountExpired" value="${userInstance?.accountExpired}" /> <g:message
			code="user.accountExpired.label" default="Account Expired" />
	</label>
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">

	<label for="accountLocked" class="checkbox"> <g:checkBox
			name="accountLocked" value="${userInstance?.accountLocked}" /> <g:message
			code="user.accountLocked.labe" default="Account Locked" />
	</label>
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled" class="checkbox"> <g:checkBox
			name="enabled" value="${userInstance?.enabled}" /> <g:message
			code="user.enabled.label" default="Enabled" />
	</label>
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">

	<label for="passwordExpired" class="checkbox"> <g:checkBox
			name="passwordExpired" value="${userInstance?.passwordExpired}" /> <g:message
			code="user.passwordExpired.label" default="Password Expired" />
	</label>
</div>

<div>
	<label for="authority"> <g:message code="role.authority.label"
			default="Authority" />
	<span class="required-indicator">*</span></label> 
	<g:select name="authority" required="" from="${roleInstanceList}"
		optionKey="id" optionValue="authority" />
</div>
<hr />