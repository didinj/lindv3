<%@ page import="com.media.eximio.Journal" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'journal.label', default: 'Journal')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <div id="edit-journal" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${journalInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${journalInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form method="post"  enctype="multipart/form-data">
      <g:hiddenField name="id" value="${journalInstance?.id}" />
      <g:hiddenField name="version" value="${journalInstance?.version}" />
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
