
<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="show-user" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list user">

      <g:if test="${userInstance?.username}">
        <li class="fieldcontain">
          <span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>

          <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.password}">
        <li class="fieldcontain">
          <span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>

          <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.fullname}">
        <li class="fieldcontain">
          <span id="fullname-label" class="property-label"><g:message code="user.fullname.label" default="Fullname" /></span>

          <span class="property-value" aria-labelledby="fullname-label"><g:fieldValue bean="${userInstance}" field="fullname"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.specialties}">
        <li class="fieldcontain">
          <span id="specialties-label" class="property-label"><g:message code="user.specialties.label" default="Specialties" /></span>

          <span class="property-value" aria-labelledby="specialties-label"><g:fieldValue bean="${userInstance}" field="specialties"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.education}">
        <li class="fieldcontain">
          <span id="education-label" class="property-label"><g:message code="user.education.label" default="Education" /></span>

        <g:each in="${userInstance.education}" var="e">
          <span class="property-value" aria-labelledby="education-label"><g:link controller="education" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.trainning}">
        <li class="fieldcontain">
          <span id="trainning-label" class="property-label"><g:message code="user.trainning.label" default="Trainning" /></span>

        <g:each in="${userInstance.trainning}" var="t">
          <span class="property-value" aria-labelledby="trainning-label"><g:link controller="trainning" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.city}">
        <li class="fieldcontain">
          <span id="city-label" class="property-label"><g:message code="user.city.label" default="City" /></span>

          <span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${userInstance}" field="city"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.country}">
        <li class="fieldcontain">
          <span id="country-label" class="property-label"><g:message code="user.country.label" default="Country" /></span>

          <span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${userInstance}" field="country"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.avatar}">
        <li class="fieldcontain">
          <span id="avatar-label" class="property-label"><g:message code="user.avatar.label" default="Avatar" /></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.hospital}">
        <li class="fieldcontain">
          <span id="hospital-label" class="property-label"><g:message code="user.hospital.label" default="Hospital" /></span>

        <g:each in="${userInstance.hospital}" var="h">
          <span class="property-value" aria-labelledby="hospital-label"><g:link controller="hospital" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.schedule}">
        <li class="fieldcontain">
          <span id="schedule-label" class="property-label"><g:message code="user.schedule.label" default="Schedule" /></span>

        <g:each in="${userInstance.schedule}" var="s">
          <span class="property-value" aria-labelledby="schedule-label"><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.organization}">
        <li class="fieldcontain">
          <span id="organization-label" class="property-label"><g:message code="user.organization.label" default="Organization" /></span>

        <g:each in="${userInstance.organization}" var="o">
          <span class="property-value" aria-labelledby="organization-label"><g:link controller="organization" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.groups}">
        <li class="fieldcontain">
          <span id="groups-label" class="property-label"><g:message code="user.groups.label" default="Groups" /></span>

        <g:each in="${userInstance.groups}" var="g">
          <span class="property-value" aria-labelledby="groups-label"><g:link controller="groups" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.points}">
        <li class="fieldcontain">
          <span id="points-label" class="property-label"><g:message code="user.points.label" default="Points" /></span>

          <span class="property-value" aria-labelledby="points-label"><g:fieldValue bean="${userInstance}" field="points"/></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.createdate}">
        <li class="fieldcontain">
          <span id="createdate-label" class="property-label"><g:message code="user.createdate.label" default="Createdate" /></span>

          <span class="property-value" aria-labelledby="createdate-label"><g:formatDate date="${userInstance?.createdate}" /></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.updatedate}">
        <li class="fieldcontain">
          <span id="updatedate-label" class="property-label"><g:message code="user.updatedate.label" default="Updatedate" /></span>

          <span class="property-value" aria-labelledby="updatedate-label"><g:formatDate date="${userInstance?.updatedate}" /></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.accountExpired}">
        <li class="fieldcontain">
          <span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>

          <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.accountLocked}">
        <li class="fieldcontain">
          <span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>

          <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.articles}">
        <li class="fieldcontain">
          <span id="articles-label" class="property-label"><g:message code="user.articles.label" default="Articles" /></span>

        <g:each in="${userInstance.articles}" var="a">
          <span class="property-value" aria-labelledby="articles-label"><g:link controller="article" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.enabled}">
        <li class="fieldcontain">
          <span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>

          <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>

        </li>
      </g:if>

      <g:if test="${userInstance?.friends}">
        <li class="fieldcontain">
          <span id="friends-label" class="property-label"><g:message code="user.friends.label" default="Friends" /></span>

        <g:each in="${userInstance.friends}" var="f">
          <span class="property-value" aria-labelledby="friends-label"><g:link controller="user" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.journals}">
        <li class="fieldcontain">
          <span id="journals-label" class="property-label"><g:message code="user.journals.label" default="Journals" /></span>

        <g:each in="${userInstance.journals}" var="j">
          <span class="property-value" aria-labelledby="journals-label"><g:link controller="journal" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${userInstance?.passwordExpired}">
        <li class="fieldcontain">
          <span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>

          <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${userInstance?.id}" />
        <g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
