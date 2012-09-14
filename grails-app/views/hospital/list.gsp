
<%@ page import="com.media.eximio.Hospital" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'hospital.label', default: 'Hospital')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="list-hospital" class="content scaffold-list" role="main">
    <div>
      <g:link action="create">New Hospital</g:link>
    </div>
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="hospname" title="${message(code: 'hospital.hospname.label', default: 'Hospname')}" />

      <g:sortableColumn property="hospaddr" title="${message(code: 'hospital.hospaddr.label', default: 'Hospaddr')}" />

      <g:sortableColumn property="hospcity" title="${message(code: 'hospital.hospcity.label', default: 'Hospcity')}" />

      <g:sortableColumn property="hospcountry" title="${message(code: 'hospital.hospcountry.label', default: 'Hospcountry')}" />

      <g:sortableColumn property="hospphone" title="${message(code: 'hospital.hospphone.label', default: 'Hospphone')}" />

      <th>EDIT</th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${hospitalInstanceList}" status="i" var="hospitalInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${hospitalInstance.id}">${fieldValue(bean: hospitalInstance, field: "hospname")}</g:link></td>

        <td>${fieldValue(bean: hospitalInstance, field: "hospaddr")}</td>

        <td>${fieldValue(bean: hospitalInstance, field: "hospcity")}</td>

        <td>${fieldValue(bean: hospitalInstance, field: "hospcountry")}</td>					

        <td>${fieldValue(bean: hospitalInstance, field: "hospphone")}</td>

        <td><g:link action="edit" id="${hospitalInstance.id}">EDIT</g:link></td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${hospitalInstanceTotal}" />
    </div>
  </div>
</body>
</html>