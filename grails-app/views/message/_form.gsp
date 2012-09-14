<%@ page import="com.media.eximio.Message" %>

<table>
  <tr>
    <td>  
      <p>To: <strong>${toUser?.fullname}</strong></p>
      <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'msgbody', 'error')} ">
        <g:textArea name="msgbody" value="${messageInstance?.msgbody}" rows="2" cols="40" />
      </div>
    </td>
  </tr>
</table>

<div style="display: none">
  <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'msgfrom', 'error')} required">
    <g:textField id="msgfrom" name="msgfrom.id" required="" value="${fromId}" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'msgto', 'error')} required">
    <g:textField id="msgto" name="msgto.id" required="" value="${toId}"/>
  </div>
  <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'messageStatus', 'error')} ">
    <g:textField name="messageStatus" value="${messageInstance?.messageStatus}"/>
  </div>

  <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'reply', 'error')} ">
    <div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'msgcreated', 'error')} required">
      <label for="msgcreated">
        <g:message code="message.msgcreated.label" default="Msgcreated" />
        <span class="required-indicator">*</span>
      </label>
      <g:datePicker name="msgcreated" precision="day"  value="${messageInstance?.msgcreated}"  />
    </div>

    <ul class="one-to-many">
      <g:each in="${messageInstance?.reply?}" var="r">
        <li><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
      </g:each>
      <li class="add">
      <g:link controller="reply" action="create" params="['message.id': messageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Reply')])}</g:link>
      </li>
    </ul>
  </div>
</div>