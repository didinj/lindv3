
<%@ page import="com.media.eximio.Trainning" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trainning.label', default: 'Trainning')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-trainning" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-trainning" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list trainning">
			
				<g:if test="${trainningInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="trainning.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${trainningInstance?.user?.id}">${trainningInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainningInstance?.institution}">
				<li class="fieldcontain">
					<span id="institution-label" class="property-label"><g:message code="trainning.institution.label" default="Institution" /></span>
					
						<span class="property-value" aria-labelledby="institution-label"><g:fieldValue bean="${trainningInstance}" field="institution"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainningInstance?.certification}">
				<li class="fieldcontain">
					<span id="certification-label" class="property-label"><g:message code="trainning.certification.label" default="Certification" /></span>
					
						<span class="property-value" aria-labelledby="certification-label"><g:fieldValue bean="${trainningInstance}" field="certification"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainningInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="trainning.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${trainningInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainningInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="trainning.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${trainningInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trainningInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="trainning.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${trainningInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${trainningInstance?.id}" />
					<g:link class="edit" action="edit" id="${trainningInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
