<%@ page import="com.media.eximio.Article" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
  <title>Create Article</title>
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
      <h1>New Article</h1>
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
        <g:form action="save"  enctype="multipart/form-data">
          <g:render template="form"/>
          <p align="right">
          <g:submitButton name="publish" class="save round3" value="Save" /></p>          
        </g:form>
      </div>  
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>
