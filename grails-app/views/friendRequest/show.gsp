
<%@ page import="com.media.eximio.FriendRequest" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'friendRequest.label', default: 'FriendRequest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-friendRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-friendRequest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list friendRequest">
			
				<g:if test="${friendRequestInstance?.fromUser}">
				<li class="fieldcontain">
					<span id="fromUser-label" class="property-label"><g:message code="friendRequest.fromUser.label" default="From User" /></span>
					
						<span class="property-value" aria-labelledby="fromUser-label"><g:link controller="user" action="show" id="${friendRequestInstance?.fromUser?.id}">${friendRequestInstance?.fromUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${friendRequestInstance?.toUser}">
				<li class="fieldcontain">
					<span id="toUser-label" class="property-label"><g:message code="friendRequest.toUser.label" default="To User" /></span>
					
						<span class="property-value" aria-labelledby="toUser-label"><g:link controller="user" action="show" id="${friendRequestInstance?.toUser?.id}">${friendRequestInstance?.toUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${friendRequestInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="friendRequest.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${friendRequestInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${friendRequestInstance?.createDate}">
				<li class="fieldcontain">
					<span id="createDate-label" class="property-label"><g:message code="friendRequest.createDate.label" default="Create Date" /></span>
					
						<span class="property-value" aria-labelledby="createDate-label"><g:formatDate date="${friendRequestInstance?.createDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${friendRequestInstance?.updateDate}">
				<li class="fieldcontain">
					<span id="updateDate-label" class="property-label"><g:message code="friendRequest.updateDate.label" default="Update Date" /></span>
					
						<span class="property-value" aria-labelledby="updateDate-label"><g:formatDate date="${friendRequestInstance?.updateDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${friendRequestInstance?.id}" />
					<g:link class="edit" action="edit" id="${friendRequestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
