
<%@ page import="com.media.eximio.Journal" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'journal.label', default: 'Journal')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="list-journal" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="journalauthor" title="${message(code: 'journal.journalauthor.label', default: 'Journalauthor')}" />

      <g:sortableColumn property="journaltitle" title="${message(code: 'journal.journaltitle.label', default: 'Journaltitle')}" />

      <th>Action</th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${journalInstanceList}" status="i" var="journalInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${journalInstance.id}">${fieldValue(bean: journalInstance, field: "journalauthor")}</g:link></td>

        <td>${fieldValue(bean: journalInstance, field: "journaltitle")}</td>

        <td><g:link action="edit" id="${journalInstance.id}">EDIT</g:link></td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${journalInstanceTotal}" />
    </div>
  </div>
</body>
</html>
