
<%@ page import="com.media.eximio.Trainning" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trainning.label', default: 'Trainning')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trainning" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trainning" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="trainning.user.label" default="User" /></th>
					
						<g:sortableColumn property="institution" title="${message(code: 'trainning.institution.label', default: 'Institution')}" />
					
						<g:sortableColumn property="certification" title="${message(code: 'trainning.certification.label', default: 'Certification')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'trainning.city.label', default: 'City')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'trainning.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="year" title="${message(code: 'trainning.year.label', default: 'Year')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trainningInstanceList}" status="i" var="trainningInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trainningInstance.id}">${fieldValue(bean: trainningInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: trainningInstance, field: "institution")}</td>
					
						<td>${fieldValue(bean: trainningInstance, field: "certification")}</td>
					
						<td>${fieldValue(bean: trainningInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: trainningInstance, field: "country")}</td>
					
						<td>${fieldValue(bean: trainningInstance, field: "year")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trainningInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
