<%@ page
	import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
<!doctype html>
<html lang="en">
<head>
<g:render template="/commons/head" />
<%--<g:layoutHead />
--%></head>

<body>

	<g:render template="/commons/navbar" />
	<br />
	<br />
	<br />
	<div class="container">
		<g:layoutBody />
		<hr />
		<g:render template="/commons/footer" />
	</div>

</body>
</html>