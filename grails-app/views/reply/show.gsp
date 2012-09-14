
<%@ page import="com.media.eximio.Reply" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reply.label', default: 'Reply')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reply" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reply">
			
				<g:if test="${replyInstance?.replybody}">
				<li class="fieldcontain">
					<span id="replybody-label" class="property-label"><g:message code="reply.replybody.label" default="Replybody" /></span>
					
						<span class="property-value" aria-labelledby="replybody-label"><g:fieldValue bean="${replyInstance}" field="replybody"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.replydate}">
				<li class="fieldcontain">
					<span id="replydate-label" class="property-label"><g:message code="reply.replydate.label" default="Replydate" /></span>
					
						<span class="property-value" aria-labelledby="replydate-label"><g:formatDate date="${replyInstance?.replydate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.replyuser}">
				<li class="fieldcontain">
					<span id="replyuser-label" class="property-label"><g:message code="reply.replyuser.label" default="Replyuser" /></span>
					
						<span class="property-value" aria-labelledby="replyuser-label"><g:link controller="user" action="show" id="${replyInstance?.replyuser?.id}">${replyInstance?.replyuser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="reply.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:link controller="message" action="show" id="${replyInstance?.message?.id}">${replyInstance?.message?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${replyInstance?.id}" />
					<g:link class="edit" action="edit" id="${replyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
