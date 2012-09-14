
<%@ page import="com.media.eximio.Education" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'education.label', default: 'Education')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-education" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-education" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list education">
			
				<g:if test="${educationInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="education.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${educationInstance?.user?.id}">${educationInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${educationInstance?.institutionname}">
				<li class="fieldcontain">
					<span id="institutionname-label" class="property-label"><g:message code="education.institutionname.label" default="Institutionname" /></span>
					
						<span class="property-value" aria-labelledby="institutionname-label"><g:fieldValue bean="${educationInstance}" field="institutionname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${educationInstance?.institutioncity}">
				<li class="fieldcontain">
					<span id="institutioncity-label" class="property-label"><g:message code="education.institutioncity.label" default="Institutioncity" /></span>
					
						<span class="property-value" aria-labelledby="institutioncity-label"><g:fieldValue bean="${educationInstance}" field="institutioncity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${educationInstance?.institutioncountry}">
				<li class="fieldcontain">
					<span id="institutioncountry-label" class="property-label"><g:message code="education.institutioncountry.label" default="Institutioncountry" /></span>
					
						<span class="property-value" aria-labelledby="institutioncountry-label"><g:fieldValue bean="${educationInstance}" field="institutioncountry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${educationInstance?.major}">
				<li class="fieldcontain">
					<span id="major-label" class="property-label"><g:message code="education.major.label" default="Major" /></span>
					
						<span class="property-value" aria-labelledby="major-label"><g:fieldValue bean="${educationInstance}" field="major"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${educationInstance?.degree}">
				<li class="fieldcontain">
					<span id="degree-label" class="property-label"><g:message code="education.degree.label" default="Degree" /></span>
					
						<span class="property-value" aria-labelledby="degree-label"><g:fieldValue bean="${educationInstance}" field="degree"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${educationInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="education.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${educationInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${educationInstance?.id}" />
					<g:link class="edit" action="edit" id="${educationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
