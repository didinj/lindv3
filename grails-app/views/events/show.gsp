
<%@ page import="com.media.eximio.Events" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'events.label', default: 'Events')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="show-events" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${eventsInstance?.eventimage}">
      <li class="fieldcontain">
        <img src="${createLink(action:'eventimage', id:eventsInstance?.id)}" />
      </li>
    </g:if>
    <g:if test="${eventsInstance?.eventname}">
      <li class="fieldcontain">
        <span id="eventname-label" class="property-label"><g:message code="events.eventname.label" default="Eventname" />:</span>

        <span class="property-value" aria-labelledby="eventname-label"><g:fieldValue bean="${eventsInstance}" field="eventname"/></span>

      </li>
    </g:if>

    <g:if test="${eventsInstance?.eventdate}">
      <li class="fieldcontain">
        <span id="eventdate-label" class="property-label"><g:message code="events.eventdate.label" default="Eventdate" />:</span>

        <span class="property-value" aria-labelledby="eventdate-label"><g:formatDate date="${eventsInstance?.eventdate}" /></span>

      </li>
    </g:if>

    <g:if test="${eventsInstance?.eventdesc}">
      <li class="fieldcontain">
        <span id="eventdesc-label" class="property-label"><g:message code="events.eventdesc.label" default="Eventdesc" />:</span>

        <span class="property-value" aria-labelledby="eventdesc-label"><g:fieldValue bean="${eventsInstance}" field="eventdesc"/></span>

      </li>
    </g:if>

    <g:if test="${eventsInstance?.eventloc}">
      <li class="fieldcontain">
        <span id="eventloc-label" class="property-label"><g:message code="events.eventloc.label" default="Eventloc" />:</span>

        <span class="property-value" aria-labelledby="eventloc-label"><g:fieldValue bean="${eventsInstance}" field="eventloc"/></span>

      </li>
    </g:if>

    <g:if test="${eventsInstance?.createdate}">
      <li class="fieldcontain">
        <span id="createdate-label" class="property-label"><g:message code="events.createdate.label" default="Createdate" />:</span>

        <span class="property-value" aria-labelledby="createdate-label"><g:formatDate date="${eventsInstance?.createdate}" /></span>

      </li>
    </g:if>

    <g:if test="${eventsInstance?.user}">
      <li class="fieldcontain">
        <span id="user-label" class="property-label"><g:message code="events.user.label" default="User" /></span>

      <g:each in="${eventsInstance.user}" var="u">
        <span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
      </g:each>

      </li>
    </g:if>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${eventsInstance?.id}" />
        <g:link class="edit" action="edit" id="${eventsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
