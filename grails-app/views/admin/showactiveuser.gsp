<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>

<html>
  <head>
    <meta name="layout" content="adminlayout"/>
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <h1><g:message code="default.show.label" args="[entityName]" /></h1>
  <div>
    <table>
      <tr>
        <td rowspan="5"><img class="avatar-large" src="${createLink(action:'avatar_image', id:userInstance?.id)}" /></td>
        <td>Username</td>
        <td>:</td>
        <td>${userInstance?.username}</td>
      </tr>
      <tr>
        <td>Full Name</td>
        <td>:</td>
        <td>${userInstance?.fullname}</td>
      </tr>
      <tr>
        <td>Specialist</td>
        <td>:</td>
        <td>${userInstance?.specialties}</td>
      </tr>
      <tr>
        <td>City</td>
        <td>:</td>
        <td>${userInstance?.city}</td>
      </tr>
      <tr>
        <td>Country</td>
        <td>:</td>
        <td>${userInstance?.country}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Hospital</td>
        <td>:</td>
        <td><g:each in="${userInstance.hospital}" var="h">
        <span class="property-value" aria-labelledby="hospital-label"><g:link controller="hospital" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
      </g:each></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Education</td>
        <td>:</td>
        <td><g:each in="${userInstance.education}" var="e">
          <span class="property-value" aria-labelledby="education-label"><g:link controller="education" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
        </g:each></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Training</td>
        <td>:</td>
        <td><g:each in="${userInstance.trainning}" var="t">
          <span class="property-value" aria-labelledby="trainning-label"><g:link controller="trainning" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
        </g:each></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Organization</td>
        <td>:</td>
        <td><g:each in="${userInstance.organization}" var="o">
          <span class="property-value" aria-labelledby="organization-label"><g:link controller="organization" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
        </g:each></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Groups</td>
        <td>:</td>
        <td><g:each in="${userInstance.grps}" var="g">
          <span class="property-value" aria-labelledby="groups-label"><g:link controller="groups" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
        </g:each></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Points</td>
        <td>:</td>
        <td>${userInstance?.points}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Create Date</td>
        <td>:</td>
        <td><g:formatDate date="${userInstance?.createdate}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Update Date</td>
        <td>:</td>
        <td><g:formatDate date="${userInstance?.updatedate}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Update Date</td>
        <td>:</td>
        <td><g:formatDate date="${userInstance?.updatedate}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Account Expired</td>
        <td>:</td>
        <td><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Account Locked</td>
        <td>:</td>
        <td><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Enabled</td>
        <td>:</td>
        <td><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>Password Expired</td>
        <td>:</td>
        <td><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
      </tr>
      <tr>
        <td colspan="4"><g:link action="editactiveuser" id="${userInstance?.id}">Edit</g:link></td>
      </tr>
    </table>
  </div>
</body>
</html>
