
<%@ page import="com.media.eximio.Article" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
	
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="articletitle">
          <g:if test="${articleInstance?.articletitle}">
            <h1><g:fieldValue bean="${articleInstance}" field="articletitle"/></h1>
          </g:if>
          <g:if test="${articleInstance?.user}">
            <p>Written by ${articleInstance?.user?.encodeAsHTML()}</p>
          </g:if>
          <g:if test="${articleInstance?.createdate}">
            <p><g:formatDate date="${articleInstance?.createdate}" /></p>
          </g:if>
        </div>
        <div class="articleabstract">
          <g:if test="${articleInstance?.articleabstract}">
            <div id="articleabstractleft">${articleInstance.articleabstract}</div>
            <div id="articleabstractright"><img align="middle" src="${createLink(controller:'article', action:'article_image',id:articleInstance?.id)}" /></div>
          </g:if>
        </div>
        <div class="articlecontent">
          <g:if test="${articleInstance?.articlecontent}">
${articleInstance.articlecontent}
          </g:if>
        </div>
        <div class="articlereference">
          <g:if test="${articleInstance?.articlereference}">
            <g:fieldValue bean="${articleInstance}" field="articlereference"/>
          </g:if>
        </div>
        <sec:ifLoggedIn>
          <div class="articlecontrol">
            <g:form>
              <fieldset class="buttons round3">
                <g:hiddenField name="id" value="${articleInstance?.id}" />
                <g:link class="edit round3" action="edit" id="${articleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete round3" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
              </fieldset>
            </g:form>
          </div>  
        </sec:ifLoggedIn>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>
