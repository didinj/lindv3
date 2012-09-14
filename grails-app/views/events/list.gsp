
<%@ page import="com.media.eximio.Events" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'events.label', default: 'Events')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="list-events" class="content scaffold-list" role="main">
    <div>
      <g:link action="create">New Events</g:link>
    </div>
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="eventname" title="${message(code: 'events.eventname.label', default: 'Eventname')}" />

      <g:sortableColumn property="eventdate" title="${message(code: 'events.eventdate.label', default: 'Eventdate')}" />

      <g:sortableColumn property="eventloc" title="${message(code: 'events.eventloc.label', default: 'Eventloc')}" />

      <g:sortableColumn property="eventdesc" title="${message(code: 'events.eventdesc.label', default: 'Eventdesc')}" />

      <th>Action</th>

      </tr>
      </thead>
      <tbody>
      <g:each in="${eventsInstanceList}" status="i" var="eventsInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${eventsInstance.id}">${fieldValue(bean: eventsInstance, field: "eventname")}</g:link></td>

        <td><g:formatDate date="${eventsInstance.eventdate}" format="MMM dd, yyyy" /></td>

        <td>${fieldValue(bean: eventsInstance, field: "eventloc")}</td>

        <td>${fieldValue(bean: eventsInstance, field: "eventdesc")}</td>

        <td><g:link action="edit" id="${eventsInstance.id}">Edit</g:link></td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${eventsInstanceTotal}" />
    </div>
  </div>
</body>
</html>
