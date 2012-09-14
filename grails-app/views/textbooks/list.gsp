
<%@ page import="com.media.eximio.Textbooks" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'textbooks.label', default: 'Textbooks')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-textbooks" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-textbooks" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tbauthor" title="${message(code: 'textbooks.tbauthor.label', default: 'Tbauthor')}" />
					
						<g:sortableColumn property="tbtitle" title="${message(code: 'textbooks.tbtitle.label', default: 'Tbtitle')}" />
					
						<g:sortableColumn property="tbabstract" title="${message(code: 'textbooks.tbabstract.label', default: 'Tbabstract')}" />
					
						<g:sortableColumn property="tbcontent" title="${message(code: 'textbooks.tbcontent.label', default: 'Tbcontent')}" />
					
						<g:sortableColumn property="tbreference" title="${message(code: 'textbooks.tbreference.label', default: 'Tbreference')}" />
					
						<g:sortableColumn property="tbimage" title="${message(code: 'textbooks.tbimage.label', default: 'Tbimage')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${textbooksInstanceList}" status="i" var="textbooksInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${textbooksInstance.id}">${fieldValue(bean: textbooksInstance, field: "tbauthor")}</g:link></td>
					
						<td>${fieldValue(bean: textbooksInstance, field: "tbtitle")}</td>
					
						<td>${fieldValue(bean: textbooksInstance, field: "tbabstract")}</td>
					
						<td>${fieldValue(bean: textbooksInstance, field: "tbcontent")}</td>
					
						<td>${fieldValue(bean: textbooksInstance, field: "tbreference")}</td>
					
						<td>${fieldValue(bean: textbooksInstance, field: "tbimage")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${textbooksInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
