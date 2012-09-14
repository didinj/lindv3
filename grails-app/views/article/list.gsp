
<%@ page import="com.media.eximio.Article" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>My Articles</h1>
      <div id="articlelist" class="round6">
        <g:if test="${articleInstanceList.size()==0}">
          <div>No Article Found</div>
        </g:if>
        <g:each in="${articleInstanceList}" status="i" var="articleInstance">
          <table>
            <tr>
              <td class="bordbot" rowspan="2"><g:link action="show" id="${articleInstance.id}"><img align="middle" class="image85" src="${createLink(controller:'article', action:'article_image',id:articleInstance.id)}" /></g:link></td>
            <td><g:link action="show" id="${articleInstance.id}">${fieldValue(bean: articleInstance, field: "articletitle")}</g:link></td>
            </tr>
            <tr>
              <td class="bordbot"><g:if test="${articleInstance.articleabstract.size()>120}"><g:set var="abstracts" value="${articleInstance.articleabstract[0..120] + '...'}" /></g:if>${abstracts}</td>
            </tr>
          </table>
        </g:each>
      </div>
      <div class="pagination">
        <g:paginate total="${articleInstanceTotal}" />
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>
