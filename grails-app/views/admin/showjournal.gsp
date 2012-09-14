<%@ page import="com.media.eximio.Journal" %>
<!doctype html>

<html>
  <head>
    <meta name="layout" content="adminlayout"/>
  <g:set var="entityName" value="${message(code: 'journal.label', default: 'Journal')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div>
    <g:link action="editjournal" id="${journalInstance.id}">Edit</g:link>
  </div>
  <h1>${journalInstance.journaltitle}</h1>
  <div>
    <p>${journalInstance.journalauthor}</p>
  </div>
  <div>
    <img class="avatar-large" src="${createLink(action:'journal_image', id:journalInstance?.id)}" />
  </div>
  <div>
    ${journalInstance.journalabstract}
  </div>
  <div>
    ${journalInstance.journalcontent}
  </div>
  <div>
    ${journalInstance.journalreference}
  </div>
</body>
</html>