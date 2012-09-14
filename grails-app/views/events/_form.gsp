<%@ page import="com.media.eximio.Events" %>

<table>
  <tr>
    <td>Event Name</td>
    <td><div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'eventname', 'error')} ">
        <g:textField name="eventname" value="${eventsInstance?.eventname}" class="longtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Event Description</td>
    <td><div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'eventdesc', 'error')} ">
        <g:textArea name="eventdesc" value="${eventsInstance?.eventdesc}" cols="80" rows="4"/>
      </div></td>
  </tr>
  <tr>
    <td>Event Location</td>
    <td><div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'eventloc', 'error')} ">
        <g:textField name="eventloc" value="${eventsInstance?.eventloc}"/>
      </div></td>
  </tr>
  <tr>
    <td>Event Date</td>
    <td><div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'eventdate', 'error')} ">
        <g:datePicker name="eventdate" precision="day"  value="${eventsInstance?.eventdate}" default="none" noSelection="['': '']" />
      </div></td>
  </tr>
  <tr>
    <td>Event Image</td>
    <td><div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'eventimage', 'error')} ">
        <input type="file" id="eventimage" name="eventimage" />
      </div></td>
  </tr>
  <tr>
    <td>Event Users</td>
    <td><div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'user', 'error')} ">
        <g:select name="user" from="${com.media.eximio.auth.User.list()}" multiple="multiple" optionKey="id" size="5" value="${eventsInstance?.user*.id}" class="many-to-many"/>
      </div></td>
  </tr>
</table>

<div class="fieldcontain ${hasErrors(bean: eventsInstance, field: 'createdate', 'error')} " style="display: none">
  <label for="createdate">
    <g:message code="events.createdate.label" default="Createdate" />

  </label>
  <g:datePicker name="createdate" precision="day"  value="${eventsInstance?.createdate}" default="none" noSelection="['': '']" />
</div>





