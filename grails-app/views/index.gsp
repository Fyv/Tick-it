<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main_full" />
<title>Tick-it !</title>
</head>
<body>
	<div class="container">
		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="hero-unit">
			<h1>Hello, world!</h1>
			<p>This is a template for a simple marketing or informational
				website. It includes a large callout called the hero unit and three
				supporting pieces of content. Use it as a starting point to create
				something more unique.</p>
			<p>
				<a class="btn btn-primary btn-large">Learn more »</a>
			</p>
		</div>

		<!-- Example row of columns -->
		<div class="row">
			<div class="span4">
				<div class="span4">
					<h2>Heading</h2>
					<ul>
						<g:each var="c"
							in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li class="controller"><g:link
									controller="${c.logicalPropertyName}">
									${c.name}
								</g:link></li>
						</g:each>
					</ul>
				</div>
			</div>
			<div class="span4">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a href="#" class="btn">View details »</a>
				</p>
			</div>
			<div class="span4">
				<h2>Heading</h2>
				<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in,
					egestas eget quam. Vestibulum id ligula porta felis euismod semper.
					Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum
					nibh, ut fermentum massa justo sit amet risus.</p>
				<p>
					<a href="#" class="btn">View details »</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
