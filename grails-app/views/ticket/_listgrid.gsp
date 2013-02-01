<%@ page import="com.tickit.Ticket"%>

<table class="table table-striped table-hover table-condensed">
	<thead>
		<tr>

			<g:sortableColumn property="title"
				title="${message(code: 'ticket.title.label', default: 'Title')}" />

			<g:sortableColumn property="dateCreated"
				title="${message(code: 'ticket.dateCreated.label', default: 'Date Created')}" />

			<g:sortableColumn property="lastUpdated"
				title="${message(code: 'ticket.lastUpdated.label', default: 'Last Updated')}" />

			<g:sortableColumn property="priority"
				title="${message(code: 'ticket.priority.label', default: 'Priority')}" />

			<g:sortableColumn property="user"
				title="${message(code: 'ticket.user.label', default: 'User')}" />

			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${ticketInstance.id}">
						${fieldValue(bean: ticketInstance, field: "title")}
					</g:link></td>

				<td><g:formatDate format="dd/MM/yyyy à HH:mm"
						date="${ticketInstance.dateCreated}" /></td>

				<td><g:formatDate format="dd/MM/yyyy à HH:mm"
						date="${ticketInstance.lastUpdated}" /></td>

				<td>
					${fieldValue(bean: ticketInstance, field: "priority")}
				</td>

				<td>
					${fieldValue(bean: ticketInstance, field: "user.username")}
				</td>

				<td class="link">
					<div class="btn-group">
						<g:link class="btn btn-primary" action="show"
							id="${ticketInstance?.id}">
							<i class="icon-search"></i>
							<g:message code="default.button.show.label" default="Show" />
						</g:link>
						<button class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown">
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><g:link action="edit" id="${ticketInstance.id}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link></li>
							<li><a href="#">Terminé</a></li>
							<!-- TODO call controller -->
						</ul>
					</div>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>