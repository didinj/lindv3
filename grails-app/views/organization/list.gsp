
<%@ page import="com.media.eximio.Organization" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div class="nav" role="navigation">
    <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
</div>
<div id="list-organization" class="content scaffold-list" role="main">
  <h1><g:message code="default.list.label" args="[entityName]" /></h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table>
    <thead>
      <tr>

    <g:sortableColumn property="orgname" title="${message(code: 'organization.orgname.label', default: 'Orgname')}" />

    <g:sortableColumn property="orgaddress" title="${message(code: 'organization.orgaddress.label', default: 'Orgaddress')}" />

    <g:sortableColumn property="orgphone" title="${message(code: 'organization.orgphone.label', default: 'Orgphone')}" />

    <g:sortableColumn property="orgcity" title="${message(code: 'organization.orgcity.label', default: 'Orgcity')}" />

    <th>Action</th>

    </tr>
    </thead>
    <tbody>
    <g:each in="${organizationInstanceList}" status="i" var="organizationInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show" id="${organizationInstance.id}">${fieldValue(bean: organizationInstance, field: "orgname")}</g:link></td>

      <td>${fieldValue(bean: organizationInstance, field: "orgaddress")}</td>

      <td>${fieldValue(bean: organizationInstance, field: "orgphone")}</td>

      <td>${fieldValue(bean: organizationInstance, field: "orgcity")}</td>

      <td><g:link action="edit" id="${organizationInstance.id}">EDIT</g:link></td>


      </tr>
    </g:each>
    </tbody>
  </table>
  <div class="pagination">
    <g:paginate total="${organizationInstanceTotal}" />
  </div>
</div>
</body>
</html>