<div class="row-fluid">
		<div class="span3 well">
			<g:render template="nav" />
		</div>
		<div class="span9">
			<div id="list-ticket" class="page-header" role="main">
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				
					<g:render template="listgrid" />
					
				<div class="pagination-centered">
					<g:paginate total="${ticketInstanceTotal}" />
				</div>
			</div>
		</div>
	</div>