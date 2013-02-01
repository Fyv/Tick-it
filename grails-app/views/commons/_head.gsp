<meta charset="UTF-8">
<title><g:layoutTitle default="${meta(name: 'app.name')}" /></title>
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport" content="initial-scale = 1.0">

<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
	
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">

<r:layoutResources />
<g:javascript src="application.js" />
<g:javascript src="jquery.js" />
<g:javascript src="bootstrap.js" />