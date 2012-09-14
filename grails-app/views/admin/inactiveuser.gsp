<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout"/>
    <title>Inactive User</title>
  </head>
  <body>
    <script type="text/javascript">
      function enableduser(param1) {
        ${remoteFunction(action:'enableduser',
        params:'\'id=\'+param1',onSuccess:'reqsent()')};
      }      
      
      function reqsent() {
        location.reload();
      }
    </script>
    <h1>Inactive User</h1>
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
    <th>Enabled</th>
  </tr>
</thead>
<tbody>
<g:each in="${inactiveUserList}" status="i" var="inactiveUser">
  <tr>
    <td><g:link action="showactiveuser" id="${inactiveUser?.id}">${fieldValue(bean: inactiveUser, field: "username")}</g:link></td>
  <td>${fieldValue(bean: inactiveUser, field: "fullname")}</td>
  <td>${fieldValue(bean: inactiveUser, field: "specialties")}</td>
  <td>${fieldValue(bean: inactiveUser, field: "city")}</td>
  <td>${fieldValue(bean: inactiveUser, field: "country")}</td>
  <td><g:link action="editactiveuser" id="${inactiveUser?.id}">Edit</g:link></td>
<td><a href="#" onclick="enableduser(${inactiveUser.id})">Enabled</a></td>
  </tr>
</g:each>
</tbody>
</table>
<div class="pagination">
  <g:paginate total="${inactiveUserTotal}" />
</div>
</body>
</html>
