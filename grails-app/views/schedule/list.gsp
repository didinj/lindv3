
<%@ page import="com.media.eximio.Schedule" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-schedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-schedule" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="day" title="${message(code: 'schedule.day.label', default: 'Day')}" />
					
						<g:sortableColumn property="starttime" title="${message(code: 'schedule.starttime.label', default: 'Starttime')}" />
					
						<g:sortableColumn property="endtime" title="${message(code: 'schedule.endtime.label', default: 'Endtime')}" />
					
						<th><g:message code="schedule.hospital.label" default="Hospital" /></th>
					
						<th><g:message code="schedule.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scheduleInstanceList}" status="i" var="scheduleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scheduleInstance.id}">${fieldValue(bean: scheduleInstance, field: "day")}</g:link></td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "starttime")}</td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "endtime")}</td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "hospital")}</td>
					
						<td>${fieldValue(bean: scheduleInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${scheduleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
