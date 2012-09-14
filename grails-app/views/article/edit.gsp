<%@ page import="com.media.eximio.Article" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
  <title><g:message code="default.edit.label" args="[entityName]" /></title>
  <resource:richTextEditor />
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${articleInstance}">
          <ul class="errors" role="alert">
            <g:eachError bean="${articleInstance}" var="error">
              <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
          </ul>
        </g:hasErrors>
        <g:form method="post"  enctype="multipart/form-data">
          <g:hiddenField name="id" value="${articleInstance?.id}" />
          <g:hiddenField name="version" value="${articleInstance?.version}" />
          <g:render template="form"/>
          <p align="right">
          <g:actionSubmit class="save round3" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="delete round3" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
          </p>
        </g:form>
      </div>
    </div>
    <div id="rightpublicfront">
      <div id="adv1">
        <g:img dir="images" file="uob.png" />
      </div>
      <div id="adv2">
        <g:img dir="images" file="md.png" />
      </div>
    </div>
  </div>
</body>
</html>
