<%@ page import="com.media.eximio.Schedule" %>


<table>
  <tr>
    <td>Hospital</td>
    <td><div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'hospital', 'error')} required">
        <g:select id="hospital" name="hospital.id" from="${com.media.eximio.Hospital.list()}" optionKey="id" required="" value="${scheduleInstance?.hospital?.id}" class="many-to-one"/>
      </div></td>
  </tr>
  <tr>
    <td>Day</td>
    <td><div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'day', 'error')} ">
        <g:textField name="day" value="${scheduleInstance?.day}"/>
      </div></td>
  </tr>
  <tr>
    <td>Start Time</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'starttime', 'error')} ">
        <g:textField name="starttime" value="${scheduleInstance?.starttime}"/>
      </div></td>
  </tr>
  <tr>
    <td>End Time</td>
    <td><div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'endtime', 'error')} ">
        <g:textField name="endtime" value="${scheduleInstance?.endtime}"/>
      </div></td>
  </tr>
</table>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'user', 'error')} required" style="display: none">
  <label for="user">
    <g:message code="schedule.user.label" default="User" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="user" name="user.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${scheduleInstance?.user?.id}" class="many-to-one"/>
</div>