
<%@ page import="com.media.eximio.Textbooks" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'textbooks.label', default: 'Textbooks')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-textbooks" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-textbooks" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list textbooks">
			
				<g:if test="${textbooksInstance?.tbauthor}">
				<li class="fieldcontain">
					<span id="tbauthor-label" class="property-label"><g:message code="textbooks.tbauthor.label" default="Tbauthor" /></span>
					
						<span class="property-value" aria-labelledby="tbauthor-label"><g:fieldValue bean="${textbooksInstance}" field="tbauthor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.tbtitle}">
				<li class="fieldcontain">
					<span id="tbtitle-label" class="property-label"><g:message code="textbooks.tbtitle.label" default="Tbtitle" /></span>
					
						<span class="property-value" aria-labelledby="tbtitle-label"><g:fieldValue bean="${textbooksInstance}" field="tbtitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.tbabstract}">
				<li class="fieldcontain">
					<span id="tbabstract-label" class="property-label"><g:message code="textbooks.tbabstract.label" default="Tbabstract" /></span>
					
						<span class="property-value" aria-labelledby="tbabstract-label"><g:fieldValue bean="${textbooksInstance}" field="tbabstract"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.tbcontent}">
				<li class="fieldcontain">
					<span id="tbcontent-label" class="property-label"><g:message code="textbooks.tbcontent.label" default="Tbcontent" /></span>
					
						<span class="property-value" aria-labelledby="tbcontent-label"><g:fieldValue bean="${textbooksInstance}" field="tbcontent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.tbreference}">
				<li class="fieldcontain">
					<span id="tbreference-label" class="property-label"><g:message code="textbooks.tbreference.label" default="Tbreference" /></span>
					
						<span class="property-value" aria-labelledby="tbreference-label"><g:fieldValue bean="${textbooksInstance}" field="tbreference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="textbooks.user.label" default="User" /></span>
					
						<g:each in="${textbooksInstance.user}" var="u">
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.tbimage}">
				<li class="fieldcontain">
					<span id="tbimage-label" class="property-label"><g:message code="textbooks.tbimage.label" default="Tbimage" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.createdate}">
				<li class="fieldcontain">
					<span id="createdate-label" class="property-label"><g:message code="textbooks.createdate.label" default="Createdate" /></span>
					
						<span class="property-value" aria-labelledby="createdate-label"><g:formatDate date="${textbooksInstance?.createdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${textbooksInstance?.updatedate}">
				<li class="fieldcontain">
					<span id="updatedate-label" class="property-label"><g:message code="textbooks.updatedate.label" default="Updatedate" /></span>
					
						<span class="property-value" aria-labelledby="updatedate-label"><g:formatDate date="${textbooksInstance?.updatedate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${textbooksInstance?.id}" />
					<g:link class="edit" action="edit" id="${textbooksInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
