<%@ page import="com.media.eximio.auth.User" %>
<%@ page import="com.media.eximio.Journal" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout"/>
    <title>LIND Admin Page</title>
  </head>
  <body>
    <p>Page for administering users, journals and other essential LIND data.</p>
    <div id="main">
      <h2>User Management (${userCount} Users)</h2>
      <div id="activeuser">
        <h3>Active Users | <g:link action="activeuser">Show All</g:link></h3>
        <table>
          <thead>
            <tr>
              <th class="bordbot">Username</th>
              <th class="bordbot">Fullname</th>
              <th class="bordbot">Create Date</th>
              <th class="bordbot">Status</th>
            </tr>
          </thead>
          <tbody>
          <g:each var="activeuser" in="${activeUserInstance}">
            <tr>
              <td><g:link action="showactiveuser" id="${activeuser.id}">${activeuser.username}</g:link></td>
            <td>${activeuser.fullname}</td>
            <td><g:formatDate format="dd MMM yyyy" date="${activeuser.createdate}"/></td>
            <td><g:if test="${activeuser.enabled==true}">Enabled</g:if><g:else>Disabled</g:else></td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div id="inactiveuser">
        <h3>Inactive Users | <g:link action="inactiveuser">Show All</g:link></h3>
        <table>
          <thead>
            <tr>
              <th class="bordbot">Username</th>
              <th class="bordbot">Fullname</th>
              <th class="bordbot">Create Date</th>
              <th class="bordbot">Status</th>
            </tr>
          </thead>
          <tbody>
          <g:each var="inactiveuser" in="${inactiveUserInstance}">
            <tr>
              <td><g:link action="showactiveuser" id="${inactiveuser.id}">${inactiveuser.username}</g:link></td>
            <td>${inactiveuser.fullname}</td>
            <td><g:formatDate format="dd MMM yyyy" date="${inactiveuser.createdate}"/></td>
            <td><g:if test="${inactiveuser.enabled==true}">Enabled</g:if><g:else>Disabled</g:else></td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div id="journal">
        <h2>Journal Management (${journalCount} Journals)</h2>
        <table>
          <thead>
            <tr>
              <th class="bordbot">Title</th>
              <th class="bordbot">Author</th>
              <th class="bordbot">Description</th>
              <th class="bordbot">Reader</th>
            </tr>
          </thead>
          <tbody>
          <g:each var="journals" in="${journalInstance}">
            <tr>
              <td class="bordbot"><g:link action="showjournal" id="${journals.id}">${journals.journaltitle}</g:link></td>
            <td class="bordbot">${journals.journalauthor}</td>
            <td class="bordbot">${journals.journalabstract}</td>
            <td class="bordbot">${journals.user}</td>
            </tr> 
          </g:each>
          </tbody>
        </table>
      </div>
    </div>    
  </body>
</html>
