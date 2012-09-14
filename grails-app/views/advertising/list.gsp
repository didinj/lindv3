
<%@ page import="com.media.eximio.Advertising" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'advertising.label', default: 'Advertising')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="list-advertising" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="advimage" title="${message(code: 'advertising.advimage.label', default: 'Advimage')}" />

      <g:sortableColumn property="advdesc" title="${message(code: 'advertising.advdesc.label', default: 'Advdesc')}" />

      <g:sortableColumn property="advclick" title="${message(code: 'advertising.advclick.label', default: 'Advclick')}" />

      <g:sortableColumn property="createdate" title="${message(code: 'advertising.createdate.label', default: 'Createdate')}" />

      <g:sortableColumn property="advtype" title="${message(code: 'advertising.advtype.label', default: 'Advtype')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${advertisingInstanceList}" status="i" var="advertisingInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${advertisingInstance.id}"><img class="image-med" src="${createLink(action:'adv_image', id:advertisingInstance.id)}" /></g:link></td>

        <td>${fieldValue(bean: advertisingInstance, field: "advdesc")}</td>

        <td>${fieldValue(bean: advertisingInstance, field: "advclick")}</td>

        <td><g:formatDate date="${advertisingInstance.createdate}" /></td>

        <td>${fieldValue(bean: advertisingInstance, field: "advtype")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${advertisingInstanceTotal}" />
    </div>
  </div>
</body>
</html>
