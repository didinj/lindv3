<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout"/>
    <title>Active User</title>
  </head>
  <body>
    <h1>Active User</h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table>
    <thead>
      <tr>
    <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
    <g:sortableColumn property="fullname" title="${message(code: 'user.fullname.label', default: 'Fullname')}" />
    <g:sortableColumn property="specialties" title="${message(code: 'user.specialties.label', default: 'Specialties')}" />
    <g:sortableColumn property="city" title="${message(code: 'user.city.label', default: 'City')}" />
    <g:sortableColumn property="country" title="${message(code: 'user.country.label', default: 'Country')}" />
    <th>Edit</th>
  </tr>
</thead>
<tbody>
<g:each in="${activeUserList}" status="i" var="activeUser">
  <tr>
    <td><g:link action="showactiveuser" id="${activeUser?.id}">${fieldValue(bean: activeUser, field: "username")}</g:link></td>
  <td>${fieldValue(bean: activeUser, field: "fullname")}</td>
  <td>${fieldValue(bean: activeUser, field: "specialties")}</td>
  <td>${fieldValue(bean: activeUser, field: "city")}</td>
  <td>${fieldValue(bean: activeUser, field: "country")}</td>
  <td><g:link action="editactiveuser" id="${activeUser?.id}">Edit</g:link></td>
  </tr>
</g:each>
</tbody>
</table>
<div class="pagination">
  <g:paginate total="${activeUserTotal}" />
</div>
</body>
</html>
