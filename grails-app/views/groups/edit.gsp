<%@ page import="com.media.eximio.Groups" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'groups.label', default: 'Groups')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>Edit Group</h1>
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${groupsInstance}">
          <ul class="errors" role="alert">
            <g:eachError bean="${groupsInstance}" var="error">
              <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
          </ul>
        </g:hasErrors>
        <g:form method="post"  enctype="multipart/form-data">
          <g:hiddenField name="id" value="${groupsInstance?.id}" />
          <g:hiddenField name="version" value="${groupsInstance?.version}" />
          <g:render template="form"/>
          <p align="right">
          <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
          </p>
        </g:form>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>
