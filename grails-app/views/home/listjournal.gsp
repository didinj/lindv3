
<%@ page import="com.media.eximio.Journal" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'journal.label', default: 'Journal')}" />
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
      <h1>All Journal</h1>
      <div id="articlelist" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:if test="${journalInstanceList.size()==0}">
          <div>No Journal Found</div>
        </g:if>
        <g:each in="${journalInstanceList}" status="i" var="journalInstance">
          <table>
            <tr>
              <td><g:link action="showjournal" id="${journalInstance.id}">${fieldValue(bean: journalInstance, field: "journaltitle")}</g:link><br />
${fieldValue(bean: journalInstance, field: "journalauthor")}
            </td>
            </tr>
            <tr>
              <td class="bordbot"><g:if test="${journalInstance.journalabstract.size()>200}"><g:set var="abstracts" value="${journalInstance.journalabstract[0..200] + '...'}" /></g:if>
            <g:else><g:set var="abstracts" value="${journalInstance.journalabstract}" /></g:else>
${abstracts} <g:link action="showjournal" id="${journalInstance.id}" class="readmore">Read More <g:img dir="images" file="btn-detail.png" align="middle"/></g:link></td>
            </tr>
          </table>
        </g:each>
        <div class="pagination">
          <g:paginate total="${journalInstanceTotal}" />
        </div>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>
