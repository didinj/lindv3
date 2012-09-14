
<%@ page import="com.media.eximio.Schedule" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-schedule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-schedule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list schedule">
			
				<g:if test="${scheduleInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="schedule.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:fieldValue bean="${scheduleInstance}" field="day"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.starttime}">
				<li class="fieldcontain">
					<span id="starttime-label" class="property-label"><g:message code="schedule.starttime.label" default="Starttime" /></span>
					
						<span class="property-value" aria-labelledby="starttime-label"><g:fieldValue bean="${scheduleInstance}" field="starttime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.endtime}">
				<li class="fieldcontain">
					<span id="endtime-label" class="property-label"><g:message code="schedule.endtime.label" default="Endtime" /></span>
					
						<span class="property-value" aria-labelledby="endtime-label"><g:fieldValue bean="${scheduleInstance}" field="endtime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.hospital}">
				<li class="fieldcontain">
					<span id="hospital-label" class="property-label"><g:message code="schedule.hospital.label" default="Hospital" /></span>
					
						<span class="property-value" aria-labelledby="hospital-label"><g:link controller="hospital" action="show" id="${scheduleInstance?.hospital?.id}">${scheduleInstance?.hospital?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduleInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="schedule.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${scheduleInstance?.user?.id}">${scheduleInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${scheduleInstance?.id}" />
					<g:link class="edit" action="edit" id="${scheduleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
