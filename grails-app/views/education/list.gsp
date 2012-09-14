
<%@ page import="com.media.eximio.Education" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'education.label', default: 'Education')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-education" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-education" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="education.user.label" default="User" /></th>
					
						<g:sortableColumn property="institutionname" title="${message(code: 'education.institutionname.label', default: 'Institutionname')}" />
					
						<g:sortableColumn property="institutioncity" title="${message(code: 'education.institutioncity.label', default: 'Institutioncity')}" />
					
						<g:sortableColumn property="institutioncountry" title="${message(code: 'education.institutioncountry.label', default: 'Institutioncountry')}" />
					
						<g:sortableColumn property="major" title="${message(code: 'education.major.label', default: 'Major')}" />
					
						<g:sortableColumn property="degree" title="${message(code: 'education.degree.label', default: 'Degree')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${educationInstanceList}" status="i" var="educationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${educationInstance.id}">${fieldValue(bean: educationInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: educationInstance, field: "institutionname")}</td>
					
						<td>${fieldValue(bean: educationInstance, field: "institutioncity")}</td>
					
						<td>${fieldValue(bean: educationInstance, field: "institutioncountry")}</td>
					
						<td>${fieldValue(bean: educationInstance, field: "major")}</td>
					
						<td>${fieldValue(bean: educationInstance, field: "degree")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${educationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
